import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../search_product/data/models/search_product.dart';
import '../../data/models/cart.dart';
import '../../data/models/cart_item.dart';
import '../../data/repository/shopping_repository.dart';


part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartItemCountIncreased>(_onItemCountIncreased);
    on<CartItemCountDecreased>(_onItemCountDecreased);
  }

  final ShoppingRepository shoppingRepository;

  void _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await shoppingRepository.loadCartItems();


      emit(CartLoaded(cart: Cart(items: [...items])));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addItemToCart(CartItem(event.item,1));
        emit(CartLoaded(cart: Cart(items: [...state.cart.items,
          CartItem(event.item,1)])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeItemFromCart(event.item);
        emit(
          CartLoaded(
            cart: Cart(
              items: [...state.cart.items]..remove(event.item),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemCountIncreased(CartItemCountIncreased event, Emitter<CartState> emit) async{
   print('inside bloc');
    final state = this.state;
    final cartItem = event.item;
    final cartCounter=event.index;
    if (state is CartLoaded) {
      try {
       final cartItemIndex = state.cart.items.indexWhere((element) => element.item==event.item.item);
       final cartItem = event.item;
       print('cart item index>>>>>>>>>>>>>>>> $cartItemIndex');

    //   if (cartItemIndex >= 0) {
           //_increaseCartItemCount(cartItem, cartItemIndex);

        // state.cart.items[cartItemIndex].count++;
         //print('count value ${  state.cart.items[cartItemIndex].count++}');
      // }

       final items= await shoppingRepository.itemCountIncreased(cartItem,cartItemIndex);
       print("items inside bloc <<<<<<<<<<<<<<<<<<<<<<< $items");
     //  final items = await shoppingRepository.loadCartItems();
       state.cart.items.removeRange(0, state.cart.items.length);
       emit(CartLoaded(cart: Cart(items:[...items] )));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemCountDecreased(CartItemCountDecreased event, Emitter<CartState> emit) async{
    final state = this.state;
    final cartItem = event.item;
    final cartCounter=event.index;
    if (state is CartLoaded) {
      try {
        final cartItemIndex = state.cart.items.indexWhere((element) => element.item==event.item.item);
        final cartItem = event.item;
        print('cart item index>>>>>>>>>>>>>>>> $cartItemIndex');

        //   if (cartItemIndex >= 0) {
        //_increaseCartItemCount(cartItem, cartItemIndex);

        // state.cart.items[cartItemIndex].count++;
        //print('count value ${  state.cart.items[cartItemIndex].count++}');
        // }

        final items= await shoppingRepository.itemCountDecreased(cartItem,cartItemIndex);
        print("items inside bloc <<<<<<<<<<<<<<<<<<<<<<< $items");
        //  final items = await shoppingRepository.loadCartItems();

          print("is emtpy ?????????? ${items.isEmpty}");
          print("is emtpy ?????????? ${items.length}");
         state.cart.items.removeRange(0, state.cart.items.length);
         emit(items.isEmpty?const CartLoaded(cart: Cart(items:[] ))
            : CartLoaded(cart: Cart(items:[...items] )));


      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _increaseCartItemCount(CartItem cartItem, int cartItemIndex) {
    _changeCartItemCount(cartItem, cartItemIndex, 1);


  }

  void _decreaseCartItemCount(CartItem cartItem, int cartItemIndex) {
    _changeCartItemCount(cartItem, cartItemIndex, -1);
  }

  void _changeCartItemCount(CartItem cartItem, int cartItemIndex, int i) {



  }


}

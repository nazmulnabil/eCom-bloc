import 'package:equatable/equatable.dart';


import 'cart_item.dart';

class Cart extends Equatable {
  const Cart({this.items = const <CartItem>[]});

   final List<CartItem> items;


  // int get totalPrice {
  //   return items.fold(0, (total, current) => total + current.price);
  // }

  @override
  List<Object> get props => [items];
}

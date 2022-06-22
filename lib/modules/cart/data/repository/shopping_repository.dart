import 'dart:async';

import '../models/cart_item.dart';


const _delay = Duration(milliseconds: 800);

const _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class ShoppingRepository {
  static final _items = <CartItem>[];


  static List<CartItem> get items => _items;

  Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<CartItem>> loadCartItems() {
    print(' items >>>>>>>>>>>>>>>>>>  $_items}');
    return Future.delayed(_delay, () => _items);
  }

  void addItemToCart(CartItem item) => _items.add(item);
  Future<List<CartItem>> itemCountIncreased(CartItem item,int index)async {
    print("inside repos >>>>>>>>>>>>>>>>>>");
    //_items[index].count++;

    print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');
    print(' item len >>>>>>>>>>>>>>>>>>  ${_items.length}');

       _items[index].count++;
    print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');
     return _items;

  }


  Future<List<CartItem>> itemCountDecreased(CartItem item,int index)async {
    print("inside repos >>>>>>>>>>>>>>>>>>");
    //_items[index].count++;

    print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');

  // _items[index].count--;
     if(_items[index].count>1) {
      _items[index].count-- ;
    }
    // else{
    //   print('cart item index in repo  >>>>>>>>>>>> $index');
    //   print('cart item  in repo  >>>>>>>>>>>> $item');
    //   print('item to delete ${_items[index]} ');
    //   print(' item len >>>>>>>>>>>>>>>>>>  ${_items.length}');
    //
    //        items.removeWhere((element) => element==item);
    //    // removeItemFromCart(_items[index]);
    // }
    print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');
    print(' item len >>>>>>>>>>>>>>>>>>  ${_items.length}');
    print('items?>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_items');
    print("decrement from repository");

    return _items;

  }


  void removeItemFromCart(CartItem item) => _items.remove(item);
}

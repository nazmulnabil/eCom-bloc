import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

const _delay = Duration(milliseconds: 800);

class ShoppingRepository {

  static final _items = <CartItem>[];
  static List<CartItem> get items => _items;

  Future<List<CartItem>> loadCartItems() {
    if (kDebugMode) {
      print(' items >>>>>>>>>>>>>>>>>>  $_items}');
    }
    return Future.delayed(_delay, () => _items);
  }

  void addItemToCart(CartItem item) => _items.add(item);
  Future<List<CartItem>> itemCountIncreased(CartItem item,int index)async {
    if (kDebugMode) {
      print("inside repos >>>>>>>>>>>>>>>>>>");
    }

    if (kDebugMode) {
      print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');
    }

    //////item count increment///////
       _items[index].count++;

    if (kDebugMode) {
      print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');
    }
     return _items;

  }


  Future<List<CartItem>> itemCountDecreased(CartItem item,int index)async {
    if (kDebugMode) {
      print("inside repos >>>>>>>>>>>>>>>>>>");
    }

    if (kDebugMode) {
      print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');
    }

    //////item count decrement///////
     if(_items[index].count>1) {
      _items[index].count-- ;
    }

    if (kDebugMode) {
      print(' item count >>>>>>>>>>>>>>>>>>  ${_items[index].count}');
    }
    if (kDebugMode) {
      print(' item len >>>>>>>>>>>>>>>>>>  ${_items.length}');
    }
    if (kDebugMode) {
      print('items?>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_items');
    }


    return _items;

  }


  void removeItemFromCart(CartItem item) => _items.remove(item);
}

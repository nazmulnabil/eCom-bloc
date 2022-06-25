part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  const CartItemAdded(this.item);

  final SearchProduct item;
 // final int count;

  @override
  List<Object> get props => [item];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.item);

  final CartItem item;


  @override
  List<Object> get props => [item];
}

class CartItemCountIncreased extends CartEvent {
  const CartItemCountIncreased(this.item,this.index);

  final CartItem item;
  final int index;


  @override
  List<Object> get props => [item,index];
}

class CartItemCountDecreased extends CartEvent {
  const CartItemCountDecreased(this.item,this.index);

  final CartItem item;
  final int index;


  @override
  List<Object> get props => [item,index];
}

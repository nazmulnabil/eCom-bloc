import 'package:ecommerce_bloc/modules/search_product/data/models/search_product.dart';
import 'package:equatable/equatable.dart';



class CartItem extends Equatable {
  CartItem(this.item, [this.count=0]);

  final SearchProduct item;
  int count;


  @override
  List<Object> get props => [item];
}
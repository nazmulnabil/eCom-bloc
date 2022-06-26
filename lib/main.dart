

import 'package:ecommerce_bloc/modules/cart/data/repository/shopping_repository.dart';
import 'package:ecommerce_bloc/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'injection.dart';
import 'modules/search_product/data/repositories/search_product_repository_interface.dart';
import 'injection.dart' as di;
void main() {

  di.init();

  SearchProductRepository searchProductRepository =locator.get<SearchProductRepository>();
  ShoppingRepository shoppingRepository=locator.get<ShoppingRepository>();
  BlocOverrides.runZoned(

        () => runApp(App(searchProductRepository:searchProductRepository, shoppingRepository: shoppingRepository,)),
    blocObserver: SimpleBlocObserver(),
  );
}




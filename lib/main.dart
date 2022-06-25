

import 'package:ecommerce_bloc/modules/cart/data/repository/shopping_repository.dart';
import 'package:ecommerce_bloc/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'app.dart';
import 'core/app_colors.dart';
import 'injection.dart';
import 'modules/search_product/data/repositories/search_product_repository_interface.dart';
import 'injection.dart' as di;
import 'package:get_it/get_it.dart';
void main() {

  di.init();

  SearchProductRepository searchProductRepository =locator.get<SearchProductRepository>();
  ShoppingRepository shoppingRepository=locator.get<ShoppingRepository>();
  BlocOverrides.runZoned(

        () => runApp(App(searchProductRepository:searchProductRepository, shoppingRepository: shoppingRepository,)),
    blocObserver: SimpleBlocObserver(),
  );
}




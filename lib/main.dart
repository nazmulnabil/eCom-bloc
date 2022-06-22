

import 'package:ecommerce_bloc/modules/cart/data/repository/shopping_repository.dart';
import 'package:ecommerce_bloc/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'app.dart';
import 'modules/search_product/data/local/product_cache.dart';
import 'modules/search_product/data/remote/product_remote_data_source_impl.dart';
import 'modules/search_product/data/repositories/search_product_repository_impl.dart';
import 'modules/search_product/data/repositories/search_product_repository_interface.dart';


void main() {
  SearchProductRepository searchProductRepository =  SearchProductRepositoryImpl
    (cache: SearchProductCache(),client:ProductRemoteDataSourceImpl(http.Client()) );
  ShoppingRepository shoppingRepository=ShoppingRepository();
  BlocOverrides.runZoned(

        () => runApp(App(searchProductRepository:searchProductRepository, shoppingRepository: shoppingRepository,)),
    blocObserver: SimpleBlocObserver(),
  );
}




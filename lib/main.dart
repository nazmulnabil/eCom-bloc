import 'package:ecommerce_bloc/data/local/product_cache.dart';
import 'package:ecommerce_bloc/data/remote/product_remote_data_source_impl.dart';
import 'package:ecommerce_bloc/data/repositories/search_product_repository_impl.dart';
import 'package:ecommerce_bloc/data/repositories/search_product_repository_interface.dart';
import 'package:ecommerce_bloc/modules/search_product/view/search_product_page.dart';
import 'package:ecommerce_bloc/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'app.dart';

void main() {
  SearchProductRepository searchProductRepository =  SearchProductRepositoryImpl
    (cache: SearchProductCache(),client:ProductRemoteDataSourceImpl(http.Client()) );
  BlocOverrides.runZoned(

        () => runApp(App(searchProductRepository:searchProductRepository,)),
    blocObserver: SimpleBlocObserver(),
  );
}




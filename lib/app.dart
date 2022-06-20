import 'package:ecommerce_bloc/data/repositories/search_product_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/search_product/bloc/search_product_bloc.dart';
import 'modules/search_product/view/search_product_page.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.searchProductRepository}) : super(key: key);

  final SearchProductRepository searchProductRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (_) => SearchProductBloc(searchProductRepository: searchProductRepository),
          child: SearchProductPage(),
        ),
      ),
    );
  }
}

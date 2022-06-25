
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/cart/data/repository/shopping_repository.dart';
import 'modules/cart/presentation/bloc/cart_bloc.dart';
import 'modules/search_product/data/repositories/search_product_repository_interface.dart';
import 'modules/search_product/presentation/bloc/search_product_bloc.dart';
import 'modules/search_product/presentation/view/search_product_page.dart';


class App extends StatelessWidget {
  const App({Key? key, required this.searchProductRepository,required this.shoppingRepository}) : super(key: key);

  final SearchProductRepository searchProductRepository;
  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return      MultiBlocProvider(

      providers: [
        BlocProvider(
          create: (_) => SearchProductBloc(
              searchProductRepository: searchProductRepository),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchProductPage(),
      ),
    )
    ;

  }
}


import 'package:ecommerce_bloc/modules/cart/data/repository/shopping_repository.dart';
import 'package:ecommerce_bloc/modules/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_bloc/modules/search_product/data/remote/product_remote_data_source_impl.dart';
import 'package:ecommerce_bloc/modules/search_product/data/repositories/search_product_repository_impl.dart';
import 'package:ecommerce_bloc/modules/search_product/presentation/bloc/search_product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'modules/search_product/data/local/product_cache.dart';
import 'modules/search_product/data/remote/product_remote_data_source.dart';
import 'modules/search_product/data/repositories/search_product_repository_interface.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(
          () => SearchProductBloc(
        searchProductRepository: locator.get<SearchProductRepository>(),)
  );

  locator.registerFactory(
          () => CartBloc(shoppingRepository: locator.get<ShoppingRepository>())
  );

  //repository
  // locator.registerLazySingleton<SearchProductRepository>(
  //       () => SearchProductRepositoryImpl(cache: locator.get<SearchProductCache>(),
  //           client: locator.get<ProductRemoteDataSource>()),
  // );

  locator.registerLazySingleton<SearchProductRepository>(
        () => SearchProductRepositoryImpl(cache: locator.get<SearchProductCache>(), client: locator.get<ProductRemoteDataSource>()),
  );

  locator.registerLazySingleton<ShoppingRepository>(
        () => ShoppingRepository(),

  );

  //data source
  locator.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(http.Client()),
  );
  locator.registerLazySingleton<SearchProductCache>(
        () => SearchProductCache(),
  );



  // network info
  //ocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // external

  //locator.registerLazySingleton(() => DataConnectionChecker());
}
import 'package:ecommerce_bloc/modules/search_product/models/search_product.dart';

abstract class ProductRemoteDataSource {
  Future<List<SearchProduct>> getSearchProduct(
      {String query, String offset, String limit});
}

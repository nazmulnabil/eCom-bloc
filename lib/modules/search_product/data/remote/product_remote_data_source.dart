

import '../models/search_product.dart';

abstract class ProductRemoteDataSource {
  Future<List<SearchProduct>> getSearchProduct(
      {String query, String offset, String limit});
}

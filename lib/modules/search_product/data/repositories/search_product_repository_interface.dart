

import '../models/search_product.dart';

abstract class SearchProductRepository {
  Future<List<SearchProduct>> search(
      {String term, String offset, String limit});

}

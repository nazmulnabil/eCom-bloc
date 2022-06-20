import 'package:ecommerce_bloc/modules/search_product/models/search_product.dart';

abstract class SearchProductRepository {
  Future<List<SearchProduct>> search(
      {String term, String offset, String limit});

}

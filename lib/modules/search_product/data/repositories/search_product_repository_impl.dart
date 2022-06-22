
import 'package:ecommerce_bloc/core/services/internet_connection.dart';
import 'package:ecommerce_bloc/modules/search_product/data/repositories/search_product_repository_interface.dart';
import '../local/product_cache.dart';
import '../models/search_product.dart';
import '../remote/product_remote_data_source.dart';

class SearchProductRepositoryImpl implements SearchProductRepository{
  const SearchProductRepositoryImpl({required this.cache, required this.client});

  final SearchProductCache cache;
  final ProductRemoteDataSource client;

  @override
  Future<List<SearchProduct>> search({String? term, String? offset, String? limit}) async{
    // TODO: implement search
       print('inside repo>>>>>>>>>> input > $term offset> $offset limit $limit');
    // final cachedResult = cache.get(term!);
    //    if (cachedResult != null) {
    //      return cachedResult;
    //    }
    final result = await client.getSearchProduct(query: term.toString(),limit: limit.toString()
        ,offset: offset.toString());
   // cache.set(term, result);
    return result;
  }
}
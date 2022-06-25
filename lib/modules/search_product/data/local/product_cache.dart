

import '../models/search_product.dart';

class SearchProductCache {
  final _cache = <String, List<SearchProduct>>{};

  List<SearchProduct>? get(String term) => _cache[term];

  void set(String term, List<SearchProduct> result) => _cache[term] = result;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}

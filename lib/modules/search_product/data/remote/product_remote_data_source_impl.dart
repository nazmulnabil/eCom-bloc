import 'dart:convert';
import 'package:ecommerce_bloc/modules/search_product/data/remote/product_remote_data_source.dart';
import 'package:http/http.dart' as http;

import '../models/search_product.dart';




class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{

  ProductRemoteDataSourceImpl(this.httpClient);

  final http.Client httpClient;

  @override
  Future<List<SearchProduct>> getSearchProduct({String? query, String? offset, String? limit}) async{
    // TODO: implement getSearchProduct
    print("inside get search product >>>>>>>>>>>>>>>>> datasouec");
    print("inside get search product >>>>>>>>>>>>>>>>> $query");
    print("inside get search product offset >>>>>>>>>>>>>>>>> $offset ");
    print("inside get search product limit >>>>>>>>>>>>>>>>> $limit ");
    List<SearchProduct> productsList;
    final response = await httpClient.get(
      Uri.https(
        'panel.supplyline.network',
        '/api/product/search-suggestions',
        <String, String>{ 'limit':'$limit','offset':'$offset',
          'search': query.toString()},
      ),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      dynamic jsonResponse = json.decode(utf8.decode(response.bodyBytes));
       print('results array >>>>>>>>>>>  ${ jsonResponse["data"]["products"]["results"]}');
       print('jsonResponse $jsonResponse >>>>>>>>>>>>>>>>>>>>>>>>>ends');

      dynamic  searchProductData = jsonResponse["data"]["products"]["results"];
       print('searchProductData>>>>>>>>>>>>>>>>>>>$searchProductData');

      productsList=  <SearchProduct>[];
      productsList= searchProductData.map<SearchProduct>((dynamic product) =>
          SearchProduct.fromJson(product)).toList() as List<SearchProduct>;
      // productsList.addAll(searchProductData.data!.products!.results!);
      print('productsList>>>>>>>>>>>>>>>>>>>$productsList');
      return productsList;
    }
    throw Exception('error fetching posts');
  }


}
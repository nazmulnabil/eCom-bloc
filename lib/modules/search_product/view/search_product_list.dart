import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../widgets/search_product_list_item.dart';

class SearchProductList extends StatelessWidget {
  const SearchProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;

    return  GridView.builder(
        gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 /3.25,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15),
        itemCount: 20,
        itemBuilder: (BuildContext ctx, index) {
          return   SearchProductListItem();
        });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/search_product.dart';
import '../bloc/search_product_bloc.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/search_product_list_item.dart';

class SearchProductList extends StatefulWidget {
  const SearchProductList({Key? key, required this.items, required this.len, required this.itemsLen}) : super(key: key);

  final List<SearchProduct> items;
  final int len;
  final int itemsLen;

  @override
  State<SearchProductList> createState() => _SearchProductListState();
}

class _SearchProductListState extends State<SearchProductList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

  }

  @override
  Widget build(BuildContext context) {

    final SearchProductBloc searchProductBloc=context.read<SearchProductBloc>();

    // final width=MediaQuery.of(context).size.width;
    print("items >>>>>>>>>>>>>>> ${widget.items}");
    print("len >>>>>>>>> ${widget.len}");
    print("items len len >>>>>>>>> ${widget.itemsLen}");
    return  GridView.builder(
        gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 /3.25,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15),
        itemCount:widget.len,
        controller: _scrollController,
        itemBuilder: (BuildContext ctx, index) {

          if( index>=widget.itemsLen) {
            return Loader();
          } else{
            return SearchProductListItem(item: widget.items[index], index: index,);
          }

        });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<SearchProductBloc>().add( const OnNextPage());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}


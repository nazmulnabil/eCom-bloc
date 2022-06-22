import 'package:ecommerce_bloc/modules/search_product/presentation/view/search_product_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_product_bloc.dart';
import '../widgets/custom_textfield.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children:  [

            const SizedBox(height: 50,),
            //Textield
            CustomTextField(),
            _SearchBody(),
          ],
        ),
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {

          int length=context.read<SearchProductBloc>().hasReachedMax?state.items.length:
          state.items.length+2;
          int itemsLength=state.items.length;

          if (kDebugMode) {
            print('length>>>>> $length');
          }
          if (kDebugMode) {
            print('items  length>>>>> $itemsLength');
          }
          return state.items.isEmpty
              ? const Text('No Results')
              : Expanded(child: SearchProductList(items: state.items,len:length, itemsLen: itemsLength,));
        }
        return const Text('Please enter a term to begin');
      },
    );
  }
}


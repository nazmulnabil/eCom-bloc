import 'package:ecommerce_bloc/core/app_colors.dart';
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
    return Container(
      color: AppColors.pageBackground,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children:  [

              const SizedBox(height: 50,),
              //Textield
              CustomTextField(bottomPadding: 32, topPadding: 0,leftPadding: 15, rightPadding: 15,),
              _SearchBody(),
            ],
          ),
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

          if (kDebugMode) {
            print('max??????????????? <<<<<< ${state.hasReachedMax}');
          }

          int length=state.hasReachedMax?state.items.length:
          state.items.length+2;

          if (kDebugMode) {
            print('length>>>>> $length');
          }

          return state.items.isEmpty
              ? const Text('No Results')
              : Expanded(child: SearchProductList(items: state.items,len:length));
        }
        return const Text('Please enter a term to begin');
      },
    );
  }
}


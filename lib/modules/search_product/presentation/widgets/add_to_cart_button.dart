import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_colors.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../data/models/search_product.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.item,required this.index})
      : super(key: key);

  final SearchProduct item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          final cartIndex = state.cart.items.indexWhere((element) =>
          element.item==item);



          print('cart item matches >>>>>>>>>>>>>>>>>  ${state.cart.items.indexWhere((element) => element.item==item)}');

          //   print('is in cart>>>>>>>>>>> $isInCart');
          // print('product item index>>>>>>>>>>> $index');
          return TextButton(
            style: TextButton.styleFrom(onSurface: AppColors.counterButtonTextColor),
            onPressed:
            cartIndex!=-1? null
                : () {
              print('is in cart>>>>>>>>>>> $cartIndex');
              context.read<CartBloc>().add(CartItemAdded(item));
            },
            child:
            cartIndex!=-1? Container(
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: const BoxDecoration(
                  color:AppColors.counterRowBackground ,
                  // border: Border.all(
                  //   color: Colors.red,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          print('cart item index in view $cartIndex ]}');
                          print('cart item >>>>>>>>>>>>>>> ${ state.cart.items[cartIndex]}');
                          //final cartItemIndex = state.cart.items.indexWhere((element) => element.item==item);
                          //
                          // if(state.cart.items[isInsideCart].count<1){
                          //   context.read<CartBloc>().add(CartItemRemoved(state.cart.items[isInsideCart]));
                          // }

                          state.cart.items[cartIndex].count<=1?
                          context.read<CartBloc>().add(CartItemRemoved(state.cart.items[cartIndex],)):
                          context.read<CartBloc>()
                              .add(CartItemCountDecreased(
                              state.cart.items[cartIndex],
                              state.cart.items[cartIndex].count
                          )
                          );
                        },

                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.decrementButtonBackground,
                          child: Icon(Icons.remove,

                            color: AppColors.colorWhite,),
                        )),
                    const SizedBox(width: 10,),
                    Text(state.cart.items[cartIndex].count.toString()),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){

                        if (kDebugMode) {
                          print('cart item >>>>>>>>>>>>>>> ${ state.cart.items[cartIndex]}');
                        }
                        //final cartItemIndex = state.cart.items.indexWhere((element) => element.item==item);


                        context.read<CartBloc>()
                            .add(CartItemCountIncreased(
                            state.cart.items[cartIndex],
                            state.cart.items[cartIndex].count
                        )
                        );
                      },
                      child: const SizedBox(
                        child: CircleAvatar(
                          backgroundColor: Colors.indigo,
                          radius: 14,
                          child: Icon(Icons.add,
                              color: AppColors.colorWhite
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
                :  CircleAvatar(
              child: Container(
                padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors:[
                            AppColors.topLinearGradientColor,
                            AppColors.bottomLinearGradientColor,

                          ])
                  ),
                  child: Icon(Icons.add)),
             // radius: 20,
            ),
          );
        }
        return const Text('Something went wrong!');
      },
    );
  }
}
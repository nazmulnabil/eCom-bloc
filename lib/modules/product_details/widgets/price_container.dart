import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:ecommerce_bloc/modules/search_product/data/models/search_product.dart';

import '../../../core/app_colors.dart';
import '../../cart/presentation/bloc/cart_bloc.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({Key? key,required this.item }) : super(key: key);
 final SearchProduct item;
  @override
  Widget build(BuildContext context) {
   var height= MediaQuery.of(context).size.width/2.2;
    var width= MediaQuery.of(context).size.width;
    return   SizedBox(
      height: MediaQuery.of(context).size.width/2.2,


      //color: Colors.red,
      child:  BlocBuilder<CartBloc, CartState>(
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
            return      Stack(
              // alignment: Alignment.bottomCenter,
              children: [

                Container(
                  margin: EdgeInsets.only(left:15,right: 15,bottom: 15),
                  padding:EdgeInsets.only(bottom: 15) ,
                  height: 116,
                  decoration: const BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(left:15,right: 15,top: 10),
                    child: Column(
                      children: [
                        //current price
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text("ক্রয়মূল্যঃ",
                                style: TextStyle(
                                    fontSize:20,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.pinkTextColor
                                ),),
                              Text("৳ ${item.charge!.currentCharge}",
                                style: const TextStyle(
                                    fontSize:20,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.pinkTextColor
                                ),),

                            ],),
                        ),

                        //selling price
                        Expanded(child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text("বিক্রয়মূল্যঃ",
                              style: TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackTextColor
                              ),),





                            Text("৳ ${item.charge!.sellingPrice}",
                              style: const TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackTextColor
                              ),),

                          ],),),

                        //horizontal divider
                        Expanded(child: Container(
                          padding:EdgeInsets.only(top:5) ,

                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 500,
                              itemBuilder: (BuildContext context,int index){
                                return const Text("- ",
                                  style:TextStyle(
                                    color: AppColors.lightGreyColor,

                                  ) ,);
                              }
                          ),

                        ),),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text("লাভঃ",
                                style: TextStyle(
                                    fontSize:16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackTextColor
                                ),),
                              Text("৳ ${item.charge!.profit}",
                                style: const TextStyle(
                                    fontSize:16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackTextColor
                                ),),

                            ],),
                        ),

                      ],
                    ),
                  ),
                ),


                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0,bottom: height/2.25),
                    child:
                    cartIndex!=-1? Container(
                      height: 36,
                      width:width/2.5,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
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
                    ) :const SizedBox(),
                  ),

                ),



                ///add to cart button
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 80,
                          child: ClipPolygon(
                            sides: 6,
                            borderRadius: 5.0,
                            child: Container(
                              decoration: const BoxDecoration(


                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors:[
                                        AppColors.topLinearGradientColor,
                                        AppColors.bottomLinearGradientColor,

                                      ])
                              ),
                              height: 50,

                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center
                                ,children:  [
                                cartIndex!=-1?Column(
                                  children: const [
                                    Image(image: AssetImage('assets/images/shopping_bag.png')),

                                    Text("কার্ট",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.colorWhite
                                      ),
                                    )
                                  ],

                                ):
                                Text("এটি\nকিনুন",
                                  style: TextStyle(
                                      fontSize:14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.colorWhite
                                  ),
                                ),
                                // Text("কিনুন",
                                //   style: TextStyle(
                                //       fontSize:14,
                                //       fontWeight: FontWeight.w400,
                                //       color: AppColors.colorWhite
                                //   ),),

                              ],),
                            ),
                          ),
                        ),



                      ],
                    )
                ),



                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.0,bottom: 5),
                    child: Text("বিস্তারিত",
                      style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.productDescriptionTextColor
                      ),),
                  ),

                ),
               cartIndex!=-1?  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 60.0,top: 40),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.colorWhite,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.counterRowBackground,

                        child: Text(state.cart.items[cartIndex].count.toString(),
                          style: const TextStyle(
                              fontSize:20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.counterButtonTextColor
                          ),),
                      ),
                    ),
                  ),

                ):SizedBox(),
              ],
            );
          }
          return const Text('Something went wrong!');
        },
      )



    );
  }
}

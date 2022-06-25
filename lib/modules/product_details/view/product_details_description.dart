import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/modules/product_details/widgets/details.dart';
import 'package:ecommerce_bloc/modules/search_product/data/models/search_product.dart';
import '../../../core/app_colors.dart';
import '../widgets/image_carousel.dart';
import '../widgets/price_container.dart';

class ProductDescription extends StatelessWidget {
   const ProductDescription({Key? key,required this.item }) : super(key: key);
  final SearchProduct item;
  get callbackFunction => null;

  @override
  Widget build(BuildContext context) {
    return   Expanded(

        child:SizedBox(
          child:  SingleChildScrollView(
            child: Column(
              children: [
                //image carousel
                ImageCarousel(images:item.images!),

                // image carousel ends here

                //product title
                 Padding(padding: const EdgeInsets.only(top: 16,left: 15,right: 5), child:
                Text(item.productName.toString(),
                  style: const TextStyle(
                      fontSize:24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.productTitleTextColor
                  ),)
                ),
                //product title ends

                //product description
                Padding(
                  padding: const EdgeInsets.only(left: 5,top: 0,bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [

                      Row(children:  [
                        const Text("ব্রান্ডঃ",
                          style: TextStyle(
                              fontSize:14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.productTitleTextColor
                          ),),
                        Text(item.brand!.name.toString(),
                          style: const TextStyle(
                              fontSize:14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.productTitleTextColor
                          ),),

                      ],),


                      Row(children:  [
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Text('•',
                            style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.pinkTextColor
                            ),),
                        ),

                        const Text("প্রডিস্ট্রিবিউটরঃ",
                          style: TextStyle(
                              fontSize:14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.productTitleTextColor
                          ),),
                        Text(item.seller.toString(),
                          style: const TextStyle(
                              fontSize:14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.productTitleTextColor
                          ),),

                      ],),


                      // price container
                    ],
                  ),
                ),

                //price container
                PriceContainer(item: item),

                //product description
                 Details(item:item),


              ],
            ),
          ),
        )
    );
  }
}

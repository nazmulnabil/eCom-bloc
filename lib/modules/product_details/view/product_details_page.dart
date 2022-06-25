
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/modules/product_details/view/product_details_description.dart';
import 'package:ecommerce_bloc/modules/search_product/data/models/search_product.dart';
import 'package:ecommerce_bloc/modules/search_product/presentation/widgets/custom_textfield.dart';
import '../../../core/app_colors.dart';

class ProductDetails extends StatelessWidget {
   const ProductDetails({Key? key,required this.item}) : super(key: key);


  final SearchProduct item;
  get callbackFunction => null;

  @override
  Widget build(BuildContext context) {
    CarouselController imageCarouselController = CarouselController();
    return SafeArea(
    maintainBottomViewPadding: true,

        child:Scaffold(

          backgroundColor: AppColors.pageBackground,

          body: Column(
            children: [
              //app bar starts
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(

                  children: [
                    IconButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pop(context);
                        },
                        //padding: EdgeInsets.all(0),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.appBarTextColor,
                        )
                    ),
                   // const SizedBox(width: 5,),
                    const Text("প্রোডাক্ট ডিটেইল",
                      style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.appBarTextColor
                      ),),
                  ],
                ),
              ),
              //appbar ends

              //body starts

              //Textfield
              CustomTextField(bottomPadding: 16, topPadding: 0,leftPadding: 15, rightPadding: 15,),


             //product description
              ProductDescription(item:item)











            ],
          ),
        ) );
  }
}

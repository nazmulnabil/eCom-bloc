import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../models/search_product.dart';
import 'bottom_loader.dart';

class SearchProductListItem extends StatelessWidget {
  const SearchProductListItem({Key? key, required this.item}) : super(key: key);

  final SearchProduct item;
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return  Stack(
      // alignment: Alignment.bottomCenter,
      children: [

        Container(
          margin: EdgeInsets.only(bottom: 15),

          decoration: const BoxDecoration(
            color: AppColors.colorWhite,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child:Column(
            children:[
              //image container
              Container(
                height:width/2.75,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: item.image.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.transparent,
                        ),
                      ],
                      image: DecorationImage(

                        image: imageProvider,
                        fit: BoxFit.fill,

                        // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.colorBurn)
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>Loader(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              ),

              //product description
               Padding(
                padding: EdgeInsets.only(top: 5.0,left: 8),
                child: Text(item.brand!.name.toString(),
                  style: const TextStyle(
                      fontSize:14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackTextColor
                  ),),
              ),

              //price row
              Container(
                margin: const EdgeInsets.only(left: 8.0,right:8,top: 5,bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Row(
                      children:  [
                        const Text("ক্রয়",
                          style: TextStyle(
                              fontSize:8,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyTextColor
                          ),),

                        SizedBox(width: 5,),

                        Text(
                          '৳ ${item.charge!.bookingPrice?.toString()}',
                          style: const TextStyle(
                              fontSize:16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.pinkTextColor
                          ),),
                      ],
                    ),
                     Text(item.charge!.discountCharge.toString(),
                      style: const TextStyle(
                          fontSize:12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.pinkTextColor,
                          decoration: TextDecoration.lineThrough
                      ),),

                  ],),
              ),

              //seeling row

              Container(
                margin:  const EdgeInsets.only(left: 8.0,right:8,bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Row(
                      children:  [
                        const Text("ক্রয়",
                          style: TextStyle(
                              fontSize:8,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyTextColor
                          ),),

                        SizedBox(width: 5,),

                        Text("৳ ${item.charge!.sellingPrice}",
                          style: const TextStyle(
                              fontSize:16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.pinkTextColor
                          ),),
                      ],
                    ),
                    Text("৳ ${item.charge!.discountCharge}",
                      style: TextStyle(
                          fontSize:12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.pinkTextColor,
                          decoration: TextDecoration.lineThrough
                      ),),

                  ],),
              ),
              // SizedBox(height: 20,)
            ],
          ),
        ),

        const Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(

              child: Icon(Icons.add),
              radius: 20,
            )
        ) ],
    );
  }
}

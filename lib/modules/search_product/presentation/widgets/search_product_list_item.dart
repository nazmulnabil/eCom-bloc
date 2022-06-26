import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_colors.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../product_details/view/product_details_page.dart';
import '../../data/models/search_product.dart';
import 'add_to_cart_button.dart';
import 'bottom_loader.dart';

class SearchProductListItem extends StatefulWidget {
  const SearchProductListItem({Key? key, required this.item, required this.index}) : super(key: key);

  final SearchProduct item;
  final int index;

  @override
  State<SearchProductListItem> createState() => _SearchProductListItemState();
}

class _SearchProductListItemState extends State<SearchProductListItem> {


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final cartBloc= BlocProvider.of<CartBloc>(context);
    return  Stack(
      // alignment: Alignment.bottomCenter,
      children: [

        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<CartBloc>.value(
                  value: cartBloc,
                  child: ProductDetails(item: widget.item,),
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),

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
                    // color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: widget.item.image.toString(),
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
                    placeholder: (context, url) =>const Loader(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                ),

                //product description
                Padding(
                  padding: const EdgeInsets.only(top: 5.0,left: 8),
                  child: Text(widget.item.productName.toString(),
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

                          const SizedBox(width: 5,),

                          Text(
                            '৳ ${widget.item.charge!.currentCharge?.toString()}',
                            style: const TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.pinkTextColor
                            ),),
                        ],
                      ),
                      Text(widget.item.charge!.discountCharge.toString(),
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
                          const Text("বিক্রয়",
                            style: TextStyle(
                                fontSize:8,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyTextColor
                            ),),

                          const SizedBox(width: 5,),

                          Text("৳ ${widget.item.charge!.sellingPrice}",
                            style: const TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.pinkTextColor
                            ),),
                        ],
                      ),

                      Row(
                        children: [
                          const Text("লাভ",
                            style: TextStyle(
                                fontSize:8,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyTextColor
                            ),),
                          Text(" ৳${widget.item.charge!.profit}",
                            style: const TextStyle(
                              fontSize:12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.pinkTextColor,
                            ),),
                        ],
                      ),

                    ],),
                ),
                // SizedBox(height: 20,)
              ],
            ),
          ),
        ),

        widget.item.stock==0?Align(
          alignment: Alignment.topRight,
          child:Container(
              height: 20,
              width: 70,
              margin: const EdgeInsets.only(top: 10.0,right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                  color:AppColors.outOfStockBg ,
                  // border: Border.all(
                  //   color: Colors.red,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: const Text("স্টকে নেই",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize:14,
                    color: AppColors.outOfStock
                ),)
          ),
        ):const SizedBox(),

        widget.item.stock!=0? Align(
          alignment: Alignment.bottomCenter,
          child:AddButton(item:widget.item, index: widget.index),
        ):const SizedBox() ],
    );
  }
}

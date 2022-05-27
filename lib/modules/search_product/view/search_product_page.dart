
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

import '../../../core/app_colors.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final width=MediaQuery.of(context).size.width;
   final height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

             SizedBox(height: 50,),
            //Textfield
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 32),
              child: SizedBox(
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed:() {

                        },
                        icon: const Icon(Icons.search,
                          color: AppColors.textfieldSearchIconColor,),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(color: AppColors.hintTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      hintText: "কাঙ্ক্ষিত পণ্যটি খুঁজুন",
                      fillColor: AppColors.colorWhite),

                ),
              ),
            ),

            Expanded(
              child: Padding(

                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: GridView.builder(
                    gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                       childAspectRatio: 2 /3.25,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15),
                    itemCount: 20,
                    itemBuilder: (BuildContext ctx, index) {
                      return   Stack(
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
                                    imageUrl: "http://via.placeholder.com/200x150",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                          // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.colorBurn)
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                            ),

                            //product description
                                const Padding(
                                  padding: EdgeInsets.only(top: 5.0,left: 8),
                                  child: Text("Lays Classic Family Chips",
                                    style: TextStyle(
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
                                        children: const [
                                          Text("ক্রয়",
                                            style: TextStyle(
                                                fontSize:8,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyTextColor
                                            ),),

                                          SizedBox(width: 5,),

                                          Text("৳ 220",
                                            style: TextStyle(
                                                fontSize:16,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.pinkTextColor
                                            ),),
                                        ],
                                      ),
                                      const Text("৳ 220",
                                        style: TextStyle(
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
                                        children: const [
                                          Text("ক্রয়",
                                            style: TextStyle(
                                                fontSize:8,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyTextColor
                                            ),),

                                          SizedBox(width: 5,),

                                          Text("৳ 220",
                                            style: TextStyle(
                                                fontSize:16,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.pinkTextColor
                                            ),),
                                        ],
                                      ),
                                      Text("৳ 220",
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
                    }),
              ),
            ),








          ],

        ),





      ),
    );
  }
}

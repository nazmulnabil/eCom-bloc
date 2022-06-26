import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/modules/search_product/data/models/search_product.dart';

class ImageCarousel extends StatelessWidget {
   const ImageCarousel({required this.images,Key? key}) : super(key: key);

  final List<Images>? images;
  get callbackFunction => null;

  @override
  Widget build(BuildContext context) {
    final int itemCount=images!.length;
    return  CarouselSlider.builder(

      itemCount: itemCount,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),

            height: MediaQuery.of(context).size.width/3,
            width: MediaQuery.of(context).size.width*0.8,
            child:ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: images![itemCount-1].image.toString(),
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
          ), options: CarouselOptions(
      height: MediaQuery.of(context).size.height/2.5 ,
      aspectRatio: 16/9,
      viewportFraction: 0.7,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
    ),
    );
  }
}

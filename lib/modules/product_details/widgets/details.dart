import 'package:flutter/cupertino.dart';
import 'package:ecommerce_bloc/modules/search_product/data/models/search_product.dart';
import '../../../core/app_colors.dart';
import 'package:html/parser.dart';

class Details extends StatelessWidget {
  const Details({Key? key,required this.item }) : super(key: key);
  final SearchProduct item;
  @override
  Widget build(BuildContext context) {
    final document = parse(item.description.toString());
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(parsedString,
        style: const TextStyle(
            fontSize:16,
            fontWeight: FontWeight.w400,
            color: AppColors.greyTextColor
        ),),
    );
  }
}

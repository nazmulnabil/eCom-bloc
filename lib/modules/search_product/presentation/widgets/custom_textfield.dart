
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_colors.dart';
import '../bloc/search_product_bloc.dart';


class CustomTextField extends StatefulWidget {

   const CustomTextField({Key? key,required this.bottomPadding, required this.leftPadding, required this.rightPadding, required this.topPadding}) : super(key: key);

   final double bottomPadding;
   final double leftPadding;
   final double rightPadding;
   final double topPadding;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
    final _textController = TextEditingController();

    late SearchProductBloc _searchProductBloc;

    @override
    void initState() {
      super.initState();
      _searchProductBloc = context.read<SearchProductBloc>();
    }

    @override
    void dispose() {
      _textController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding:  EdgeInsets.only(left: widget.leftPadding,right: widget.rightPadding,bottom: widget.bottomPadding),
      child: SizedBox(
        height: 48,
        child: TextField(
          controller: _textController,
          autocorrect: false,
          onChanged: (text) {
            _searchProductBloc.add(
              TextChanged(text: text),
            );
          },
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
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Padding(
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
    );
  }
}

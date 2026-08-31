import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchAnyProductTextField extends StatelessWidget {
  const SearchAnyProductTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Color(0xffFFFFFF).withValues(alpha: 0.4),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.search, color: AppColors.brownLightRGB),
          suffixIcon: Icon(
            Icons.mic_none_rounded,
            color: AppColors.blackColor,
          ),
          hint: Text(
            "Search any Product..",
            style: AppStyles.style14.copyWith(
              fontWeight: FontWeight(400),
              color: AppColors.orangeColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        //
      ),
    );
  }
}

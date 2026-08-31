import 'package:e_commerce_nti_project/core/utils/app_colors.dart';
import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SkipText extends StatelessWidget {
  const SkipText({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: AppStyles.style18.copyWith(
          color: AppColors.brownLight,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/responsive_layout.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  
  const CustomTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.chocolateBrown, // Line color
            ),
          ),
          SizedBox(width: 16.w), // Space between line and text
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: ResponsiveLayout.getLoaderSize(context) - 38.sp,
              color: AppColors.chocolateBrown,
            ),
            textAlign: TextAlign.center, // Center text alignment
          ),
          SizedBox(width: 16.w), // Space between text and line
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.chocolateBrown, // Line color
            ),
          ),
        ],
      ),
    );
  }
}
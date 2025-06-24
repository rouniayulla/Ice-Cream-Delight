// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
   Color? backgroundColor;
   Color? borderColor;
   double? fontSize;
  final double borderRadius;
  final String text;
  final Color textColor;
  final VoidCallback onTap;

   CustomButton({
    super.key,
    required this.width,
    required this.height,
    this.backgroundColor,
    this.borderColor,
    this.fontSize,
    required this.borderRadius,
    required this.text,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor??Colors.transparent,
          border: Border.all(color: borderColor??Colors.transparent,width:2.w),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize:fontSize??20.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';


class SnackBarMessage {
  void showSuccessSnackBar({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: AppColors.pureWhite,fontSize:20.sp),
        ),
        backgroundColor: AppColors.strawberryPink,
      ),
    );
  }

  void showErrorSnackBar({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: AppColors.pureWhite,fontSize:20.sp),
        ),
        backgroundColor: AppColors.cherryBlossom,
      ),
    );
  }}

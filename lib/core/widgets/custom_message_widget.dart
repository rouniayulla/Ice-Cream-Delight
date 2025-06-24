import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/responsive_layout.dart';

class CustomMessageWidget extends StatelessWidget {
  final String message;
  final Color? textColor;
  final IconData? icon;

  const CustomMessageWidget({
    super.key,
    required this.message,
    this.textColor = AppColors.deepBlack,
    this.icon = Icons.info_outline,
  });

  Widget _buildMobile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(blurRadius: 4.r, color: Colors.black12)],
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: textColor),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 14.sp, color: textColor),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTablet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(blurRadius: 6.r, color: Colors.black12)],
      ),
      child: Row(
        children: [
          Icon(icon, size: 24.sp, color: textColor),
          SizedBox(width: 14.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 16.sp, color: textColor),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
      margin: EdgeInsets.symmetric(horizontal: 80.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(blurRadius: 8.r, color: Colors.black12)],
      ),
      child: Row(
        children: [
          Icon(icon, size: 28.sp, color: textColor),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 18.sp, color: textColor),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobile(),
      tablet: _buildTablet(),
      desktop: _buildDesktop(),
    );
  }
}

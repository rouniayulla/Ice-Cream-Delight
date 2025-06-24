import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cherryBlossom,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Footer Links
          Row(
            children: [
              _buildFooterItem('Contact Us', () {}),
              _buildFooterItem('Privacy Policy', () {}),
              _buildFooterItem('Terms of Service', () {}),
              _buildFooterItem('FAQ', () {}),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            '© 2025 Ice Cream Shop. All rights reserved.',
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        
        ],
      ),
    );
  }

  Widget _buildFooterItem(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }
}
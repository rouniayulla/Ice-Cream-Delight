import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/responsive_layout.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width >= 1024;
    final iconSize = isLargeScreen ? 28.sp : 32.sp;
    final padding = isLargeScreen
        ? EdgeInsets.symmetric(vertical: 20.h, horizontal: 60.w)
        : EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w);

    return Container(
      color: AppColors.cherryBlossom,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Navigation links
          Row(
            children: [
              _buildNavItem('Home', () {}, context),
              _buildNavItem('Shops', () {}, context),
              _buildNavItem('Products', () {}, context),
              _buildNavItem('About Us', () {}, context),
            ],
          ),

          // Action icons
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.white, size: iconSize),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart,
                    color: Colors.white, size: iconSize),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.facebook_rounded,
                    color: Colors.white, size: iconSize),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap, BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontSize:24.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/images.dart';
import 'package:icecreamshop/core/utils/responsive_layout.dart';
import 'package:icecreamshop/core/widgets/custom_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildLayout(
        context,
       
      ),
      tablet: _buildLayout(
        context,
       
      ),
      desktop: _buildDesktopLayout(context),
    );
  }

  Widget _buildLayout(
    BuildContext context, ) {
    return Container(
      height:800.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.background1), // Background image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeTitle(45.sp, true),
                    SizedBox(height: 30.h),
                    iceCreamDescription(22.sp, context),
                    SizedBox(height: 50.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:140.w),
                      child: CustomButton(
                        text: 'where to buy',
                        backgroundColor: AppColors.cherryBlossom,
                        borderRadius: 18.sp,
                        height: 70.h,
                        width: 200.w,
                        textColor: AppColors.pureWhite,
                        onTap: () {
                        
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      height:800.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.background1), // Background image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeTitle(30.sp, true),
                    SizedBox(height: 30.h),
                    iceCreamDescription(16.sp, context),
                    SizedBox(height: 50.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:140.w),
                      child: CustomButton(
                        text: 'where to buy',
                        backgroundColor: AppColors.cherryBlossom,
                        borderRadius: 18.sp,
                        height: 70.h,
                        width: 200.w,
                        textColor: AppColors.pureWhite,
                        onTap: () {
                        
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  Widget iceCreamDescription(double fontSize, BuildContext context) {
    return SizedBox(
      width:510.w,
      child: Text(
        "At our ice cream shop, we serve happiness in scoops!\n"
        "Discover our delightful flavors, made with natural ingredients.\n"
        "Each scoop is crafted to perfection, ensuring a creamy, rich texture that melts in your mouth.\n"
        "Whether you're craving classic vanilla, decadent chocolate, or unique seasonal flavors, we have something for everyone.\n"
        "Come and enjoy a sweet escape with family and friends, and let every bite bring a smile to your face!",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: fontSize),
        textAlign: TextAlign.center, // Align text to the right
      ),
    );
  }

  Widget welcomeTitle(double fontSize, bool isMultiLine) {
    return SizedBox(
        width:510.w,
      child: Text(
        isMultiLine
            ? "RELAX AND TAKE A\nMOMENT TO ENJOY\nYOURSELF"
            : "RELAX AND TAKE A MOMENT TO ENJOY YOURSELF",
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: AppColors.cherryBlossom,
        ),
        textAlign: TextAlign.center, // Align text to the right
      ),
    );
  }
}
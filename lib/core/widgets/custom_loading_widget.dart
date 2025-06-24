import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/responsive_layout.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  
 

  @override
  Widget build(BuildContext context) {
    final loaderSize = ResponsiveLayout.getLoaderSize(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: loaderSize.sp,
          width: loaderSize.sp,
          child: CircularProgressIndicator(
            color: AppColors.orangeSherbet,
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}

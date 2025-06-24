import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/responsive_layout.dart';
import 'package:icecreamshop/features/flavors/domain/entities/flavors.dart';

class IceCreamFlavorListView extends StatelessWidget {
  final List<IceCreamFlavor> flavors;

  const IceCreamFlavorListView({Key? key, required this.flavors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
        crossAxisCount: 2, // Two items per row
        childAspectRatio:ResponsiveLayout.getchildAspectRatio(context), // Aspect ratio for the items
        crossAxisSpacing: 16.w, // Space between columns
        mainAxisSpacing: 16.h, // Space between rows
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
      itemCount: flavors.length,
      itemBuilder: (context, index) {
        final flavor = flavors[index];
        return _buildFlavorTile(flavor, index);
      },
    );
  }

  Widget _buildFlavorTile(IceCreamFlavor flavor, int index) {
    return Directionality(
      textDirection: index %2==1  ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        // color: Colors.red,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(flavor.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16), // Space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flavor.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: AppColors.purple,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${flavor.price.toStringAsFixed(2)} ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: AppColors.cherryBlossom,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    flavor.description,
                    style: TextStyle(
                      color: AppColors.deepBlack,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
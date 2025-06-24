import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/images.dart';
import 'package:icecreamshop/features/shops/domain/entities/shop.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/add_update_delete_shop/add_update_delete_shop_bloc.dart';
import 'package:icecreamshop/features/shops/presentation/pages/add_update_delete_popup.dart';

class IceCreamShopListView extends StatelessWidget {
  final List<IceCreamShopEntity> shops;

  const IceCreamShopListView({super.key, required this.shops});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: shops.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final shop = shops[index];
          return Center(
            child: InkWell(
              onTap: () => _handleTap(context, shop),
              child: _ShopCard(shop: shop),
            ),
          );
        },
      ),
    );
  }

  void _handleTap(BuildContext context, IceCreamShopEntity shop) {
    showIceCreamShopDialog(
      context: context,
      entity: shop,
      onUpdate: (updated) =>
          context.read<AddUpdateDeleteShopBloc>().add(UpdateShopEvent(shop: updated)),
      onDelete: () =>
          context.read<AddUpdateDeleteShopBloc>().add(DeleteShopEvent(shopId: shop.id)),
    );
  }
}

class _ShopCard extends StatelessWidget {
  final IceCreamShopEntity shop;

  const _ShopCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 300.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage(AppImages.background1), // Update with your image path
          fit: BoxFit.cover,
        ),
        
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6), // Background color for text readability
          ),
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(shop.name, 18.sp, FontWeight.bold, AppColors.chocolateBrown),
              SizedBox(height: 4.h),
              _buildIconText(Icons.location_on, shop.location),
              SizedBox(height: 4.h),
              _buildIconText(Icons.phone, shop.phone,),
              SizedBox(height: 4.h),
              _buildText(shop.description, 12.sp, FontWeight.normal, AppColors.deepBlack, maxLines: 2),
              SizedBox(height: 6.h),
              _buildStatus(shop),
              const Spacer(),
              _buildText('Days: ${shop.daysOpen}', 12.sp, FontWeight.normal, AppColors.deepBlack),
              SizedBox(height: 2.h),
              _buildText('Hours: ${shop.openTime} - ${shop.closeTime}', 12.sp, FontWeight.normal, AppColors.deepBlack),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, double fontSize, FontWeight weight, Color color, {int maxLines = 1}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: weight, color: color),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.black54),
        SizedBox(width: 4.w),
        Expanded(
          child: _buildText(text, 14.sp, FontWeight.normal, AppColors.deepBlack),
        ),
      ],
    );
  }

  Widget _buildStatus(IceCreamShopEntity shop) {
    final isOpen = shop.isOpen;
    final color = isOpen ? AppColors.purple : AppColors.chocolateBrown;
    return Row(
      children: [
        Icon(isOpen ? Icons.check_circle : Icons.cancel, color: color, size: 18.sp),
        SizedBox(width: 6.w),
        _buildText(isOpen ? 'Open now' : 'Closed', 14.sp, FontWeight.bold, color),
      ],
    );
  }
}
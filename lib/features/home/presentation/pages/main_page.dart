import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/widgets/custom_title_widget.dart';
import 'package:icecreamshop/features/about_us/presentation/pages/about_us_page.dart';
import 'package:icecreamshop/features/flavors/presentation/pages/flavors_page.dart';
import 'package:icecreamshop/features/home/presentation/pages/home_page.dart';
import 'package:icecreamshop/features/home/presentation/widgets/footer_widget.dart';
import 'package:icecreamshop/features/home/presentation/widgets/header_widget.dart';
import 'package:icecreamshop/features/shops/presentation/pages/shops_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          HeaderWidget(),
          HomePage(),
          SizedBox(height:10.h,),
           CustomTitleWidget(title: 'Ice Cream Flavours'),
          FlavorsPage(),
          CustomTitleWidget(title: ' Where I Buy'),
          ShopsPage(),
          CustomTitleWidget(title: 'About Us'),
          AboutUsPage(),
          FooterWidget()
         
        ],
      ),
    );
  }
}

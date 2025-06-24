import 'package:flutter/material.dart';
import 'package:icecreamshop/core/utils/images.dart';
import 'package:icecreamshop/features/about_us/presentation/widgets/about_us_card_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.background4),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: AboutUsCard(),
        ),
      ),
    );
  }
}

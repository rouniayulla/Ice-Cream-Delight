import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/widgets/custom_button_widget.dart';

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header('About Us', AppColors.purple, 32),
            SizedBox(height: 20.h),

            _Body(
              'Welcome to our ice cream paradise! We are dedicated to '
              'crafting the finest ice creams using natural ingredients. '
              'Our mission is to bring joy and happiness to every scoop.',
              18,
            ),
            SizedBox(height: 20.h),

            _Header('Our Story', AppColors.cherryBlossom, 24),
            SizedBox(height: 10.h),
            _Body(
              'Founded in 2020, we started our journey with a passion for '
              'ice cream and a commitment to quality. Each flavor is crafted '
              'with love, using only the freshest local ingredients.',
            ),
            SizedBox(height: 20.h),

            _Header('Why Choose Us?', AppColors.purple, 24),
            SizedBox(height: 10.h),
            _Body(
              'We believe in creating memorable experiences. Our ice creams '
              'are not only delicious but also made with sustainable practices. '
              'Join us for a scoop and taste the difference!',
            ),
            SizedBox(height: 20.h),

            const _LearnMoreButton(),
          ],
        ),
      ),
    );
  }
}

/* ─── PRIVATE, REUSABLE SUB‑WIDGETS ─────────────────────────────────────── */

class _Header extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const _Header(this.text, this.color, this.size);

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size.sp,               // ← responsive font
          fontWeight: FontWeight.bold,
          color: color,
        ),
      );
}

class _Body extends StatelessWidget {
  final String text;
  final double size;
  const _Body(this.text, [this.size = 16]);

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: size.sp, color: Colors.black54), // responsive
      );
}

class _LearnMoreButton extends StatelessWidget {
  const _LearnMoreButton();

  @override
  Widget build(BuildContext context) =>
   CustomButton(
        text: 'Learn More',
        onTap: () {},                    
        backgroundColor: AppColors.purple,
        borderRadius: 18.sp,
        height: 50.h,
        width: 140.w,
        fontSize: 16.sp,
        textColor: AppColors.pureWhite,
      );
}

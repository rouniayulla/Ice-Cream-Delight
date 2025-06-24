import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });
   static double getLoaderSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024) {
      return 60; // Desktop size
    } else if (width >= 500) {
      return 45; // Tablet size
    } else {
      return 30; // Mobile size
    }
  }
   static double getchildAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024) {
      return 5; // Desktop size
    } else if (width >= 500) {
      return 4; // Tablet size
    } else {
      return 3; // Mobile size
    }
  }
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 500 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024) {
      return desktop;
    } else if (width >= 500) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

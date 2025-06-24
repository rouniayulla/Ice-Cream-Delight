import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/utils/color.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.pureWhite, // Updated to pureWhite
  primaryColor: AppColors.cherryBlossom,
  fontFamily: 'Poppins', // Use any friendly rounded font

  colorScheme: ColorScheme.light(
    primary: AppColors.cherryBlossom,
    secondary: AppColors.mangoYellow,
    surface: AppColors.pureWhite,
    onPrimary: AppColors.pureWhite,
    onSecondary: AppColors.deepBlack,
    onSurface: AppColors.deepBlack,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.pureWhite,
    elevation: 2,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.deepBlack,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(color: AppColors.cherryBlossom),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.cherryBlossom,
    foregroundColor: AppColors.pureWhite,
    elevation: 4,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.pureWhite,
      backgroundColor: AppColors.cherryBlossom,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.roseCream,
    floatingLabelStyle: const TextStyle(color: AppColors.cherryBlossom),
    iconColor: AppColors.cherryBlossom,
    prefixIconColor: AppColors.cherryBlossom,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.cherryBlossom, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.caramelGold),
    ),
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.cherryBlossom,
    linearTrackColor: AppColors.roseCream,
  ),

  textTheme:  TextTheme(
    headlineLarge: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: AppColors.deepBlack),
    bodyLarge: TextStyle(fontSize: 20.sp, color: AppColors.deepBlack),
    bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.deepBlack),
    titleMedium: TextStyle(fontSize: 20.sp, color: AppColors.pureWhite),
    labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.cherryBlossom),
  ),
);
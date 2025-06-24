import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/services/supabase_service.dart';
import 'package:icecreamshop/core/theme/app_theme.dart';
import 'package:icecreamshop/features/flavors/presentation/bloc/flavors/flavors_bloc.dart';

import 'package:icecreamshop/features/home/presentation/pages/main_page.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/add_update_delete_shop/add_update_delete_shop_bloc.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/shops/shops_bloc.dart';
import 'injection_container.dart' as di;
import 'package:window_size/window_size.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
   
    setWindowMinSize(const Size(1000, 1000));
  }

  await di.init();
  await SupabaseService.init();
  
  runApp(const IceCreamApp());
}

class IceCreamApp extends StatelessWidget {
  const IceCreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
             BlocProvider(
              create: (_) => di.sl<FlavorsBloc>()..add(GetAllFlavorsEvent())),
             BlocProvider(
              create: (_) => di.sl<ShopsBloc>()..add(GetAllShopsEvent())),
             BlocProvider(
              create: (_) => di.sl<AddUpdateDeleteShopBloc>()),
          ],
      child: ScreenUtilInit(
        designSize: const Size(1440, 1024), // Web desktop default
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}



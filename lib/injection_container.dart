import 'package:icecreamshop/features/flavors/data/datasources/flavors_remote_data_source.dart';
import 'package:icecreamshop/features/flavors/data/repositories/flavors_repository_impl.dart';
import 'package:icecreamshop/features/flavors/domain/repositories/flavors_repository.dart';
import 'package:icecreamshop/features/flavors/domain/usecases/get_all_flavors.dart';
import 'package:icecreamshop/features/flavors/presentation/bloc/flavors/flavors_bloc.dart';
import 'package:icecreamshop/features/shops/data/datasources/shop_remote_data_source.dart';
import 'package:icecreamshop/features/shops/data/repositories/shop_repository_impl.dart';
import 'package:icecreamshop/features/shops/domain/repositories/shop_repository.dart';
import 'package:icecreamshop/features/shops/domain/usecases/add_shop.dart';
import 'package:icecreamshop/features/shops/domain/usecases/delete_shop.dart';
import 'package:icecreamshop/features/shops/domain/usecases/get_all_shops.dart';
import 'package:icecreamshop/features/shops/domain/usecases/update_shop.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/add_update_delete_shop/add_update_delete_shop_bloc.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/shops/shops_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => ShopsBloc(getAllShops: sl()));
  sl.registerFactory(() => AddUpdateDeleteShopBloc(
      addShop: sl(), updateShop: sl(), deleteShop: sl()));
  sl.registerFactory(() => FlavorsBloc(getAllFlavors: sl()
    ));

// Usecases

  sl.registerLazySingleton(() => GetIceCreamShopsUseCase(sl()));
  sl.registerLazySingleton(() => AddIceCreamShopsUseCase(sl()));
  sl.registerLazySingleton(() => DeleteIceCreamShopsUseCase(sl()));
  sl.registerLazySingleton(() => UpdateIceCreamShopsUseCase(sl()));
  sl.registerLazySingleton(() => GetIceCreamFlavorsUseCase(sl()));

// Repository

  sl.registerLazySingleton<ShopsRepository>(() => ShopRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<FlavorsRepository>(() => FlavorRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));
// Datasources

  sl.registerLazySingleton<ShopRemoteDataSource>(
      () => ShopRemoteDataSourceImpl(client: sl()));
   sl.registerLazySingleton<FlavorRemoteDataSource>(
      () => FlavorRemoteDataSourceImpl(client: sl()));
 

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
import 'package:dartz/dartz.dart';
import 'package:icecreamshop/features/shops/data/models/shop_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/exceptions.dart';

abstract class ShopRemoteDataSource {
  Future<List<IceCreamShopModel>> getAllShops();
  Future<Unit> addShop(IceCreamShopModel shopModel);
  Future<Unit> deleteShop(int shopId); // assuming unique name
  Future<Unit> updateShop(IceCreamShopModel shopModel);
}

class ShopRemoteDataSourceImpl implements ShopRemoteDataSource {
  final SupabaseClient client;

  ShopRemoteDataSourceImpl({required this.client});

  @override
  Future<List<IceCreamShopModel>> getAllShops() async {
    final response = await client
        .from('shops')
        .select()
        .order('name', ascending: true);

    try {
      final List<IceCreamShopModel> shops = (response as List)
          .map((json) => IceCreamShopModel.fromJson(json))
          .toList();
      
      return shops;
    } catch (e) {
       
      throw ServerException();
    }
  }

  @override
  Future<Unit> addShop(IceCreamShopModel shopModel) async {
    final data = shopModel.toJson();

    final response = await client.from('shops').insert(data);

    if (response.error == null) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteShop(int shopId) async {
    
    final response = await client
        .from('shops')
        .delete()
        .eq('id', shopId);
  
    if (response == null) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateShop(IceCreamShopModel shopModel) async {
   
    final data = shopModel.toJson();
   
    final response = await client
        .from('shops')
        .update(data)
        .eq('id', shopModel.id);

    if (response==null) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}

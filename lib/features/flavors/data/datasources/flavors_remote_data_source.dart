
import 'package:icecreamshop/features/flavors/data/models/flavors_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/exceptions.dart';

abstract class FlavorRemoteDataSource {
  Future<List<IceCreamFlavorModel>> getAllFlavors();
}

class FlavorRemoteDataSourceImpl implements FlavorRemoteDataSource {
  final SupabaseClient client;

  FlavorRemoteDataSourceImpl({required this.client});

  @override
  Future<List<IceCreamFlavorModel>> getAllFlavors() async {
    final response = await client
        .from('flavors')
        .select()
        .order('name', ascending: true);

    try {
      final List<IceCreamFlavorModel> flavors = (response as List)
          .map((json) => IceCreamFlavorModel.fromJson(json))
          .toList();
      print('flavors${flavors}');
      return flavors;
    } catch (e) {
      throw ServerException();
    }
  }

  
}
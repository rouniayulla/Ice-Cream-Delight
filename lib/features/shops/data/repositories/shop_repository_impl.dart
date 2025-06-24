import 'package:dartz/dartz.dart';
import 'package:icecreamshop/features/shops/data/models/shop_model.dart';
import 'package:icecreamshop/features/shops/domain/entities/shop.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/shop_repository.dart';
import '../datasources/shop_remote_data_source.dart';

typedef ShopMutation = Future<Unit> Function();

class ShopRepositoryImpl implements ShopsRepository {
  final ShopRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ShopRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<IceCreamShopEntity>>> getAllShops() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteShops = await remoteDataSource.getAllShops();
        return Right(remoteShops);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addShop(IceCreamShopEntity shop) async {
    final model = IceCreamShopModel.fromEntity(shop);
    return await _handleMutation(() => remoteDataSource.addShop(model));
  }

  @override
  Future<Either<Failure, Unit>> deleteShop(int shopId) async {
    return await _handleMutation(() => remoteDataSource.deleteShop(shopId));
  }

  @override
  Future<Either<Failure, Unit>> updateShop(IceCreamShopEntity shop) async {
    //  print("Updating shop with data: $shop");
    final model = IceCreamShopModel.fromEntity(shop);
    return await _handleMutation(() => remoteDataSource.updateShop(model));
  }

  Future<Either<Failure, Unit>> _handleMutation(
    ShopMutation mutation,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await mutation();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}

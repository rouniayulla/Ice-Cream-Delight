import 'package:icecreamshop/core/error/failures.dart';

import '../entities/shop.dart';
import 'package:dartz/dartz.dart';



abstract class ShopsRepository {
  Future<Either<Failure, List<IceCreamShopEntity>>> getAllShops();
  Future<Either<Failure, Unit>> deleteShop(int id);
  Future<Either<Failure, Unit>> updateShop(IceCreamShopEntity shop);
  Future<Either<Failure, Unit>> addShop(IceCreamShopEntity shop);
}

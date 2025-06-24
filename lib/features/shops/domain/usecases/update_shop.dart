import 'package:dartz/dartz.dart';
import 'package:icecreamshop/features/shops/domain/entities/shop.dart';
import 'package:icecreamshop/features/shops/domain/repositories/shop_repository.dart';

import '../../../../core/error/failures.dart';


class UpdateIceCreamShopsUseCase {
  final ShopsRepository repository;

  UpdateIceCreamShopsUseCase(this.repository);

  Future<Either<Failure, Unit>> call(IceCreamShopEntity shop) async {
    return await repository.updateShop(shop);
  }
}
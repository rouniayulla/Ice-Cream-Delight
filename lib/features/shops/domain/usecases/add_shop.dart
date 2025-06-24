import 'package:dartz/dartz.dart';
import 'package:icecreamshop/features/shops/domain/entities/shop.dart';
import 'package:icecreamshop/features/shops/domain/repositories/shop_repository.dart';

import '../../../../core/error/failures.dart';


class AddIceCreamShopsUseCase {
  final ShopsRepository repository;

  AddIceCreamShopsUseCase(this.repository);

  Future<Either<Failure, Unit>> call(IceCreamShopEntity shop) async {
    return await repository.addShop(shop);
  }
}
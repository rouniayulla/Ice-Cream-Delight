import 'package:icecreamshop/features/shops/domain/entities/shop.dart';
import 'package:icecreamshop/features/shops/domain/repositories/shop_repository.dart';


import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class GetIceCreamShopsUseCase {
  final ShopsRepository repository;

  GetIceCreamShopsUseCase(this.repository);

  Future<Either<Failure, List<IceCreamShopEntity>>> call() async {
    return await repository.getAllShops();
  }
}

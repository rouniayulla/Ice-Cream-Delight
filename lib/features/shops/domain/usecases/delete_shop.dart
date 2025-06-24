import 'package:icecreamshop/features/shops/domain/repositories/shop_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class DeleteIceCreamShopsUseCase {
  final ShopsRepository repository;

  DeleteIceCreamShopsUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int shopId) async {
    return await repository.deleteShop(shopId);
  }
}
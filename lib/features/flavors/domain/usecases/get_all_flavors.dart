import 'package:dartz/dartz.dart';
import 'package:icecreamshop/features/flavors/domain/entities/flavors.dart';
import 'package:icecreamshop/features/flavors/domain/repositories/flavors_repository.dart';
import '../../../../core/error/failures.dart';


class GetIceCreamFlavorsUseCase {
  final FlavorsRepository repository;

  GetIceCreamFlavorsUseCase(this.repository);

  Future<Either<Failure, List<IceCreamFlavor>>> call() async {
    return await repository.getAllFlavors();
  }
}
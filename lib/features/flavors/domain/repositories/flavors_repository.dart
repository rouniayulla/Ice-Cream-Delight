import 'package:dartz/dartz.dart';
import 'package:icecreamshop/features/flavors/domain/entities/flavors.dart';
import '../../../../core/error/failures.dart';

abstract class FlavorsRepository {
  Future<Either<Failure, List<IceCreamFlavor>>> getAllFlavors();
}
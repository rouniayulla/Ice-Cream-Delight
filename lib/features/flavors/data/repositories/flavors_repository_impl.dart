import 'package:dartz/dartz.dart';
import 'package:icecreamshop/features/flavors/data/datasources/flavors_remote_data_source.dart';
import 'package:icecreamshop/features/flavors/domain/entities/flavors.dart';

import 'package:icecreamshop/features/flavors/domain/repositories/flavors_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';


class FlavorRepositoryImpl implements FlavorsRepository {
  final FlavorRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FlavorRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<IceCreamFlavor>>> getAllFlavors() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFlavors = await remoteDataSource.getAllFlavors();
        return Right(remoteFlavors);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
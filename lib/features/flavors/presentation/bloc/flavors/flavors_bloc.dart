import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:icecreamshop/core/error/failures.dart';
import 'package:icecreamshop/core/strings/failure.dart';
import 'package:icecreamshop/features/flavors/domain/entities/flavors.dart';

import 'package:icecreamshop/features/flavors/domain/usecases/get_all_flavors.dart';

part 'flavors_event.dart';
part 'flavors_state.dart';

class FlavorsBloc extends Bloc<FlavorsEvent, FlavorsState> {
  final GetIceCreamFlavorsUseCase getAllFlavors;

  FlavorsBloc({required this.getAllFlavors}) : super(FlavorsInitial()) {
    on<FlavorsEvent>((event, emit) async {
      if (event is GetAllFlavorsEvent ) {
        emit(LoadingFlavorsState());

        final failureOrFlavors = await getAllFlavors();
        emit(_mapFailureOrFlavorsToState(failureOrFlavors));
      }
    });
  }

  FlavorsState _mapFailureOrFlavorsToState(Either<Failure, List<IceCreamFlavor>> either) {
    return either.fold(
      (failure) => ErrorFlavorsState(message: _mapFailureToMessage(failure)),
      (flavors) => LoadedFlavorsState(flavors: flavors),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return SERVER_FAILURE_MESSAGE;
      case const (OfflineFailure):
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
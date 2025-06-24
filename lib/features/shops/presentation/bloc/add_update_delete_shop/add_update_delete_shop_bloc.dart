import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:icecreamshop/core/error/failures.dart';
import 'package:icecreamshop/core/strings/failure.dart';
import 'package:icecreamshop/core/strings/messages.dart';
import 'package:icecreamshop/features/shops/domain/entities/shop.dart';
import 'package:icecreamshop/features/shops/domain/usecases/add_shop.dart';
import 'package:icecreamshop/features/shops/domain/usecases/delete_shop.dart';
import 'package:icecreamshop/features/shops/domain/usecases/update_shop.dart';

part 'add_update_delete_shop_event.dart';
part 'add_update_delete_shop_state.dart';

class AddUpdateDeleteShopBloc
    extends Bloc<AddUpdateDeleteShopEvent, AddUpdateDeleteShopState> {
  final AddIceCreamShopsUseCase addShop;
  final UpdateIceCreamShopsUseCase updateShop;
  final DeleteIceCreamShopsUseCase deleteShop;
  AddUpdateDeleteShopBloc({
    required this.addShop,
    required this.updateShop,
    required this.deleteShop,
  }) : super(AddUpdateDeleteShopInitial()) {
    on<AddUpdateDeleteShopEvent>((event, emit) async {
      if (event is AddShopEvent) {
        emit(LoadingAddUpdateDeleteShopState());

        final failureOrDoneMessage = await addShop(event.shop);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            ADD_SUCCESS_MESSAGE,
          ),
        );
      } else if (event is UpdateShopEvent) {
        emit(LoadingAddUpdateDeleteShopState());

        final failureOrDoneMessage = await updateShop(event.shop);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            UPDATE_SUCCESS_MESSAGE,
          ),
        );
      } else if (event is DeleteShopEvent) {
        emit(LoadingAddUpdateDeleteShopState());

        final failureOrDoneMessage = await deleteShop(event.shopId);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            DELETE_SUCCESS_MESSAGE,
          ),
        );
      }
    });
  }
  AddUpdateDeleteShopState _eitherDoneMessageOrErrorState(
    Either<Failure, Unit> either,
    String message,
  ) {
    return either.fold(
      (failure) =>
          ErrorAddUpdateDeleteShopState(message: _mapFailureToMessage(failure)),
      (_) => MessageAddUpdateDeleteShopState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return SERVER_FAILURE_MESSAGE;
      case const (OfflineFailure):
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:icecreamshop/core/error/failures.dart';
import 'package:icecreamshop/core/strings/failure.dart';
import 'package:icecreamshop/features/shops/domain/entities/shop.dart';
import 'package:icecreamshop/features/shops/domain/usecases/get_all_shops.dart';

part 'shops_event.dart';
part 'shops_state.dart';

class ShopsBloc extends Bloc<ShopsEvent, ShopsState> {
  final GetIceCreamShopsUseCase getAllShops;
  ShopsBloc({required this.getAllShops}) : super(ShopsInitial()) {
    on<ShopsEvent>((event, emit) async {
      if (event is GetAllShopsEvent || event is RefreshShopsEvent)  {
        emit(LoadingShopsState());
         
        final failureOrPosts = await getAllShops();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } 
    });
      
    
  }
  ShopsState _mapFailureOrPostsToState(Either<Failure, List<IceCreamShopEntity>> either) {
    return either.fold(
      (failure) => ErrorShopsState(message: _mapFailureToMessage(failure)),
      (shops) => LoadedShopsState(
        shops: shops,
      ),
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

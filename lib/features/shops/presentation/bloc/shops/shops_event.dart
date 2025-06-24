part of 'shops_bloc.dart';

sealed class ShopsEvent extends Equatable {
  const ShopsEvent();

  @override
  List<Object> get props => [];
  
}
class GetAllShopsEvent extends ShopsEvent {}

class RefreshShopsEvent extends ShopsEvent {}
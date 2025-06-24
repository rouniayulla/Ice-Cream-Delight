part of 'shops_bloc.dart';

sealed class ShopsState extends Equatable {
  const ShopsState();
  
  @override
  List<Object> get props => [];
}

final class ShopsInitial extends ShopsState {}
class LoadingShopsState extends ShopsState {}

class LoadedShopsState extends ShopsState {
  final List<IceCreamShopEntity> shops;

  const LoadedShopsState({required this.shops});

  @override
  List<Object> get props => [shops];
}

class ErrorShopsState extends ShopsState {
  final String message;

  const ErrorShopsState({required this.message});

  @override
  List<Object> get props => [message];
}
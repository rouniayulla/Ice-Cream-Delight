part of 'add_update_delete_shop_bloc.dart';

sealed class AddUpdateDeleteShopState extends Equatable {
  const AddUpdateDeleteShopState();
  
  @override
  List<Object> get props => [];
}

final class AddUpdateDeleteShopInitial extends AddUpdateDeleteShopState {}
class AddDeleteUpdatePostInitial extends AddUpdateDeleteShopState {}

class LoadingAddUpdateDeleteShopState extends AddUpdateDeleteShopState {}

class ErrorAddUpdateDeleteShopState extends AddUpdateDeleteShopState {
  final String message;

  const ErrorAddUpdateDeleteShopState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddUpdateDeleteShopState extends AddUpdateDeleteShopState {
  final String message;

  const MessageAddUpdateDeleteShopState({required this.message});

  @override
  List<Object> get props => [message];
}
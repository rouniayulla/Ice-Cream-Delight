part of 'add_update_delete_shop_bloc.dart';

sealed class AddUpdateDeleteShopEvent extends Equatable {
  const AddUpdateDeleteShopEvent();

  @override
  List<Object> get props => [];
}
class AddShopEvent extends AddUpdateDeleteShopEvent {
  final IceCreamShopEntity shop;

  const AddShopEvent({required this.shop});

  @override
  List<Object> get props => [shop];
}

class UpdateShopEvent extends AddUpdateDeleteShopEvent {
  final IceCreamShopEntity shop;

  const UpdateShopEvent({required this.shop});

  @override
  List<Object> get props => [shop];
}

class DeleteShopEvent extends AddUpdateDeleteShopEvent {
  final int shopId;

  const DeleteShopEvent({required this.shopId});

  @override
  List<Object> get props => [shopId];
}
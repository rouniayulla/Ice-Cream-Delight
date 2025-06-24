import 'package:icecreamshop/features/shops/domain/entities/shop.dart';

class IceCreamShopModel extends IceCreamShopEntity {
  const IceCreamShopModel({
    required super.id,
    required super.name,
    required super.location,
    required super.phone,
    required super.description,
    required super.isOpen,
    required super.daysOpen,
    required super.openTime,
    required super.closeTime,
  });

  factory IceCreamShopModel.fromJson(Map<String, dynamic> json) {
    return IceCreamShopModel(
      id: json['id'] as int,
      name: json['name'] as String,
      location: json['location'] as String,
      phone: json['phone'] as String,
      description: json['description'] as String,
      isOpen: json['is_open'] as bool,
      daysOpen: json['days_open'] as String,
      openTime: json['open_time'] as String,
      closeTime: json['close_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'location': location,
      'phone': phone,
      'description': description,
      'is_open': isOpen,
      'days_open': daysOpen,
      'open_time': openTime,
      'close_time': closeTime,
    };
  }

  factory IceCreamShopModel.fromEntity(IceCreamShopEntity entity) {
    return IceCreamShopModel(
      id:entity.id,
      name: entity.name,
      location: entity.location,
      phone: entity.phone,
      description: entity.description,
      isOpen: entity.isOpen,
      daysOpen: entity.daysOpen,
      openTime: entity.openTime,
      closeTime: entity.closeTime,
    );
  }
}

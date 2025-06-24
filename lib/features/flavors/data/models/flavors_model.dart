import 'package:icecreamshop/features/flavors/domain/entities/flavors.dart';

class IceCreamFlavorModel extends IceCreamFlavor {
  const IceCreamFlavorModel({
    required super.name,
    required super.price,
    required super.description,
    required super.image,
  });

  factory IceCreamFlavorModel.fromJson(Map<String, dynamic> json) {
    return IceCreamFlavorModel(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(), // Convert to double
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'image': image,
    };
  }

  factory IceCreamFlavorModel.fromEntity(IceCreamFlavor entity) {
    return IceCreamFlavorModel(
      name: entity.name,
      price: entity.price,
      description: entity.description,
      image: entity.image,
    );
  }
}
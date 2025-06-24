import 'package:equatable/equatable.dart';

class IceCreamFlavor extends Equatable {
  final String name;
  final double price;
  final String description;
  final String image;

  const IceCreamFlavor({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [name, price, description, image];
}
import 'package:equatable/equatable.dart';

class IceCreamShopEntity extends Equatable {
  final int id;
  final String name;
  final String location;
  final String phone;
  final String description;
  final bool isOpen;
  final String daysOpen;
  final String openTime;
  final String closeTime;

  const IceCreamShopEntity({
      required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.description,
    required this.isOpen,
    required this.daysOpen,
    required this.openTime,
    required this.closeTime,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        phone,
        description,
        isOpen,
        daysOpen,
        openTime,
        closeTime,
      ];
}

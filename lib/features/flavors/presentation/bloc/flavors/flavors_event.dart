part of 'flavors_bloc.dart';

sealed class FlavorsEvent extends Equatable {
  const FlavorsEvent();

  @override
  List<Object> get props => [];
}

class GetAllFlavorsEvent extends FlavorsEvent {}


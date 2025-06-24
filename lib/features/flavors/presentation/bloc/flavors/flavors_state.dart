part of 'flavors_bloc.dart';

sealed class FlavorsState extends Equatable {
  const FlavorsState();
  
  @override
  List<Object> get props => [];
}

final class FlavorsInitial extends FlavorsState {}

class LoadingFlavorsState extends FlavorsState {}

class LoadedFlavorsState extends FlavorsState {
  final List<IceCreamFlavor> flavors;

  const LoadedFlavorsState({required this.flavors});

  @override
  List<Object> get props => [flavors];
}

class ErrorFlavorsState extends FlavorsState {
  final String message;

  const ErrorFlavorsState({required this.message});

  @override
  List<Object> get props => [message];
}
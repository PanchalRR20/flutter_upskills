import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LandingCubitState extends Equatable {}

class StateInitial extends LandingCubitState {
  @override
  List<Object?> get props => [];
}

class NavigateToNextScreen extends LandingCubitState {
  String routeName;
  NavigateToNextScreen({required this.routeName});

  @override
  List<Object?> get props => [routeName];
}

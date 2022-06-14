import 'package:equatable/equatable.dart';
import 'package:upskill_practices/features/dashboard/database/models/user_model.dart';

abstract class DashboardCubitState extends Equatable {}

class StateInitial extends DashboardCubitState {
  @override
  List<Object?> get props => [];
}

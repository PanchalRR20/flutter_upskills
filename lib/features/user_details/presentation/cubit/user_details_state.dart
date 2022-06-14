import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../dashboard/database/models/user_model.dart';

abstract class UserDetailCubitState extends Equatable {}

class StateInitial extends UserDetailCubitState {
  @override
  List<Object?> get props => [];
}

class RecordFetchedState extends UserDetailCubitState {
  List<UserModel> data;

  RecordFetchedState({required this.data});

  @override
  List<Object?> get props => [data];
}

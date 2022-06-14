import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../database/models/user_model.dart';
import '../../../user_details/domain/usecases/fetch_user_data_case.dart';
import 'dashboard_cubit_state.dart';

class DashboardCubit extends Cubit<DashboardCubitState> {
  DashboardCubit() : super(StateInitial());
}

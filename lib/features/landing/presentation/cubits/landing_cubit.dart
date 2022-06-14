import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upskill_practices/core/utils/route_name.dart';

import '../../../../core/utils/pref.dart';
import 'landing_cubit_state.dart';

class LandingCubit extends Cubit<LandingCubitState> {
  LandingCubit() : super(StateInitial());

  loadSplash() {
    Timer(const Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
      bool isUserLoggedIn = prefs.getBool(PrefKeys.Is_User_Logged_In) ?? false;
      if (isUserLoggedIn) {
        emit(NavigateToNextScreen(routeName: RouteName.dashboard));
      } else {
        emit(NavigateToNextScreen(routeName: RouteName.login));
      }
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upskill_practices/features/authentication/domain/usecases/login_case.dart';

import '../../../../core/utils/pref.dart';
import 'login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  LoginDataSourceImpl();

  @override
  Future<String> loginCall(LoginParams params) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(email: params.email, password: params.password); //LOGIN
      User? currentUser = FirebaseAuth.instance.currentUser;
      debugPrint(currentUser.toString());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(PrefKeys.Is_User_Logged_In, true);
      return "Login Successful";
  }
}

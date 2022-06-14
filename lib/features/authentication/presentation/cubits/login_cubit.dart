import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upskill_practices/core/utils/pref.dart';
import 'package:upskill_practices/features/authentication/data/repositories/login_repositories_impl.dart';

import '../../domain/repositories/login_repositories.dart';
import '../../domain/usecases/login_case.dart';
import 'login_cubit_states.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCase? loginCase;

  LoginCubit({this.loginCase}) : super(StateInitial());

  logInUser(String email, String password) async {
    // try {
    //   emit(StateProgressLoading());
    //   loginCase
    //       ?.callCase(LoginParams(email: email, password: password))
    //       .listen((event) {
    //     event.fold((l) => emit(LoginStateError(l.toString())),
    //         (r) => emit(LoginSuccessState("Success")));
    //   });
    //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    //   UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
    //       email: email, password: password); //LOGIN
    //   User? currentUser = FirebaseAuth.instance.currentUser;
    //   debugPrint(currentUser.toString());
    //   final prefs = await SharedPreferences.getInstance();
    //   await prefs.setBool(PrefKeys.Is_User_Logged_In, true);
    //   emit(LoginSuccessState("Success"));
    // } catch (e) {
    //   emit(LoginStateError(e.toString()));
    // }
    //emit(StateProgressLoading());
    emit(StateProgressLoading());
    var login = LoginParams(email: email, password: password);
    loginCase?.callCase(login).listen((event) {
      event.fold((l) => emit(LoginStateError(l.toString())),
          (r) => emit(LoginSuccessState("Success")));
    });
  }

  logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(PrefKeys.Is_User_Logged_In, false);
      emit(LogOutState("Logged Out"));
    } catch (e) {
      emit(LoginStateError(e.toString()));
    }
  }

/*signEmailAndPassword(String email, String password) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.createUserWithEmailAndPassword(
        email: "abc@gmail.com", password: "123456"); //User Creation
    emit(LoginSuccessState("Success"));
  }
  googleSignIn(String email, String password) async {
    try {
      GoogleSignIn googleSignIn = new GoogleSignIn();
      var account = await googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication token = await account.authentication;
        Map<String, dynamic> map = Map();
        map['firstname'] = account.displayName;
        map['lastname'] = account.displayName;
        map['email'] = account.email;
        map['app_user_id'] = account.id;
        map['social_platform'] = 'Google';
        map['social_access_token'] = token.idToken;
        map['other_app_data'] = '';
        final GoogleSignInAuthentication? googleAuth = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        await firebaseAuth.signInWithCredential(credential);

        User? currentUser = FirebaseAuth.instance.currentUser;
        debugPrint(currentUser.toString());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(PrefKeys.Is_User_Logged_In, true);
        emit(LoginSuccessState("Success"));

      } else {
        emit(LoginStateError('User not logged In'));
      }

    } catch (e) {
      emit(LoginStateError(e.toString()));
    }
  }


  facebookSignIn(String email, String password) async {
    try {

      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
       FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

        User? currentUser = FirebaseAuth.instance.currentUser;
        debugPrint(currentUser.toString());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(PrefKeys.Is_User_Logged_In, true);
        emit(LoginSuccessState("Success"));

    } catch (e) {
      emit(LoginStateError(e.toString()));
    }
  }

  Future<void> signInWithEmailAndLink(String email, String password) async {
    //_userEmail = _emailController.text;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.sendSignInLinkToEmail(
      email: email,
     actionCodeSettings: ActionCodeSettings(
       url: 'https://upskill.page.link/76UZ',
       handleCodeInApp: true,
       iOSBundleId:'com.example.upskill_practices',
       androidPackageName: 'com.example.upskill_practices',
       androidInstallApp: true,
       androidMinimumVersion: "1"
     )
    );
  }*/
}

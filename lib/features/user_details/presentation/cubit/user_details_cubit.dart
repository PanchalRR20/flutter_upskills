import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/features/user_details/presentation/cubit/user_details_state.dart';

import '../../../../core/base/use_case.dart';
import '../../../dashboard/database/models/user_model.dart';
import '../../domain/usecases/fetch_user_list_data_case.dart';


class UserDetailCubit extends Cubit<UserDetailCubitState> {
  FetchUserListDataCase? fetchUserListDataCase;
  UserDetailCubit({this.fetchUserListDataCase}) : super(StateInitial());


  fetchUserDataList() async {
    /*var collection = await FirebaseFirestore.instance.collection("user").get();
    List<UserModel> userList = [];
    userList = collection.docs.map((snapshot) {
      return UserModel.fromJson(snapshot.data());
    }).toList();
    emit(RecordFetchedState(data: userList));*/

    fetchUserListDataCase?.callCase(NoParams()).listen((event) {
      event.fold((l){
        debugPrint(l.toString());

      }, (userList) {
        debugPrint(userList.length.toString());
        emit(StateInitial());
        emit(RecordFetchedState(data: userList));
      });

    });
  }
}

/*

fetchUserData() async {
  // var collection = FirebaseFirestore.instance.collection("users");
  // var docSnapshot = await collection.doc('os4Hgy5u7FGsOwdAcErP').get();
  // var getMapValue = docSnapshot.data();
  // print(getMapValue);
  var collection = await FirebaseFirestore.instance.collection("user").doc("3g3EiNfUoGBTvJF6oFUD").get();
  var getMapValue = collection.data();
  print(getMapValue);

}

fetchUserDataList() async {
  var collection = await FirebaseFirestore.instance.collection("user").where("age",isGreaterThanOrEqualTo: 10).get();
  // List<UserModel> userList = [];
  // userList = collection.docs.map((snapshot) {
  //   return UserModel.fromJson(snapshot.data());
  // }).toList();
  List<UserModel> userList = [];
  userList = collection.docs.map((snapshot) {
    return UserModel.fromJson(snapshot.data());
  }).toList();
}*/

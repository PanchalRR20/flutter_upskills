import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:upskill_practices/features/dashboard/database/models/user_model.dart';

import '../../../../core/base/base_failures.dart';
import 'user_details_local_src.dart';

class UserDetailsLocalSrcImpl extends UserDetailsLocalSrc {
  @override
  Stream<Either<Failure, List<UserModel>>> fetchAdminList() async* {
    /*var collection = await FirebaseFirestore.instance
        .collection("user")
        .get();
    List<UserModel> userList = [];
    userList = collection.docs.map((snapshot) {
      return UserModel.fromJson(snapshot.data());
    }).toList();
    yield Right(userList);
    List<UserModel> list = [];
    await collectionStream<UserModel>(
      path: 'user',
      builder: (data, documentID) => UserModel.fromJson(data),
      sort: (lhs, rhs) => lhs.firstName.compareTo(rhs.firstName),
    ).listen((event) {
      list = event;
      debugPrint("LIST :: ${list.length}");
    });

    yield Right(list);*/

    List<UserModel> userList = [];

    var fbSnapshots = FirebaseFirestore.instance.collection('user').snapshots();
    Stream<QuerySnapshot<dynamic>> stream = fbSnapshots;

    await for (QuerySnapshot<dynamic> data in stream) {
      QuerySnapshot<dynamic> event = data;
      if (event.docs.isNotEmpty) {
        userList.clear();
        for (var element in event.docs) {
          UserModel model = UserModel.fromJson(element.data());
          userList.add(model);
        }
        yield Right(userList);
      } else {
        userList = [];
        yield Right(userList);
      }
    }
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    print("PATHHHHHH : $path");
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) {
            var source =
                snapshot.metadata.isFromCache ? "local cache" : "server";
            return builder(
                (snapshot.data() as Map<String, dynamic>), snapshot.id);
          })
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}

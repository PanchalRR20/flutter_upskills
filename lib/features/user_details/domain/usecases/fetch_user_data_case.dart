import 'package:dartz/dartz.dart';
import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/core/base/use_case.dart';

import '../repositories/user_details_repositories.dart';

class FetchUserDataCase extends UseCase<String, UserData> {
  UserDetailsRepositories userDetailsRepositories;

  FetchUserDataCase(this.userDetailsRepositories);

  @override
  Stream<Either<Failure, String>> callCase(params) {
    return userDetailsRepositories.fetchUserDetails(params);
  }
}

class UserData {
  String documentId;

  UserData(this.documentId);
}

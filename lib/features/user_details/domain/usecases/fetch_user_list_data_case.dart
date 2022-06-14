import 'package:dartz/dartz.dart';
import 'package:upskill_practices/features/dashboard/database/models/user_model.dart';

import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../repositories/user_details_repositories.dart';

class FetchUserListDataCase extends UseCase<List<UserModel>, NoParams> {
  UserDetailsRepositories userDetailsRepositories;

  FetchUserListDataCase(this.userDetailsRepositories);

  @override
  Stream<Either<Failure, List<UserModel>>> callCase(NoParams params) {
    return userDetailsRepositories.fetchAdminList();
  }
}

class AdminData {}

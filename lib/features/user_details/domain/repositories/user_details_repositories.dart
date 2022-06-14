
import 'package:dartz/dartz.dart';
import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/features/user_details/domain/usecases/fetch_user_data_case.dart';

import '../../../dashboard/database/models/user_model.dart';

abstract class UserDetailsRepositories{
  Stream<Either<Failure, List<UserModel>>> fetchAdminList();

  Stream<Either<Failure, String>> fetchUserDetails(UserData params);

}
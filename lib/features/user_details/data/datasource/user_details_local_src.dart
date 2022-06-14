

import 'package:dartz/dartz.dart';
import 'package:upskill_practices/features/dashboard/database/models/user_model.dart';

import '../../../../core/base/base_failures.dart';

abstract class UserDetailsLocalSrc{
  Stream<Either<Failure, List<UserModel>>> fetchAdminList();

}
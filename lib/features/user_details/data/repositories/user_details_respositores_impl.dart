import 'package:dartz/dartz.dart';

import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/features/user_details/domain/usecases/fetch_user_data_case.dart';

import '../../../dashboard/database/models/user_model.dart';
import '../../domain/repositories/user_details_repositories.dart';
import '../datasource/user_details_local_src.dart';

class UserDetailsRepositoriesImpl extends UserDetailsRepositories {
  UserDetailsLocalSrc userDetailsLocalSrc;

  UserDetailsRepositoriesImpl(this.userDetailsLocalSrc);

  /* @override
  Stream<Either<Failure, List<UserModel>>> fetchAdminList() {
    return userDetailsLocalSrc.fetchAdminList();
   */ /* try {
      var list = await userDetailsLocalSrc.fetchAdminList();
      yield Right(list);
    } catch (e) {
      yield Left(FailureMessage(e.toString()));
    }*/ /*
  }*/

  @override
  Stream<Either<Failure, List<UserModel>>> fetchAdminList()  {
   /* Stream<Either<Failure, List<UserModel>>>? stream = userDetailsLocalSrc.fetchAdminList();
    if (stream != null) {
      await for (Either<Failure, List<UserModel>> data in stream) {
        yield data;
      }
    }*/
    return userDetailsLocalSrc.fetchAdminList();
  }

  @override
  Stream<Either<Failure, String>> fetchUserDetails(UserData params) {
    // TODO: implement fetchUserDetails
    throw UnimplementedError();
  }
}


import 'package:dartz/dartz.dart';

import '../../../../core/base/base_failures.dart';
import '../usecases/login_case.dart';

abstract class LoginRepositories {
  Stream<Either<Failure, String>> loginCall(LoginParams params);

}

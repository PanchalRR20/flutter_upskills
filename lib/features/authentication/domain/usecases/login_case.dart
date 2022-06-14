import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:upskill_practices/core/base/base_failures.dart';

import '../../../../core/base/use_case.dart';
import '../repositories/login_repositories.dart';

class LoginCase extends UseCase<String, LoginParams> {
  LoginRepositories loginRepositories;

  LoginCase(this.loginRepositories);

  @override
  Stream<Either<Failure, String>> callCase(LoginParams params) {
    return loginRepositories.loginCall(params);
  }
}

class LoginParams extends Equatable {
  String email;
  String password;

  LoginParams({this.email = "", this.password = ""});

  @override
  List<Object?> get props => [id];
}

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import 'package:upskill_practices/core/base/base_failures.dart';

import 'package:upskill_practices/features/authentication/domain/usecases/login_case.dart';

import '../../../../core/utils/strings.dart';
import '../../domain/repositories/login_repositories.dart';
import '../datasource/login_data_source.dart';

class LoginRepositoriesImpl extends LoginRepositories {
  LoginDataSource loginDataSource;
  LoginRepositoriesImpl(this.loginDataSource);

  @override
  Stream<Either<Failure, String>> loginCall(LoginParams params) async* {
    try {
      var response = await loginDataSource.loginCall(params);
      yield Right(response);
    } catch (e, s) {
      if (e is PlatformException) {
        if (e.code == Strings.k_ERROR_NETWORK_CODE) {
          yield Left(FailureMessage(Strings.kNoInternetConnection));
        } else if (e.code == Strings.k_ERROR_USER_NOT_FOUND) {
          yield Left(FailureMessage(Strings.kUserNotFound));
        } else if (e.code == Strings.k_ERROR_PASSWORD) {
          yield Left(FailureMessage(Strings.kWrongPassword));
        } else if (e.code == 'ERROR_USER_DISABLED') {
          yield Left(FailureMessage(Strings.kUserDisable));
        } else if (e.code == 'ERROR_INVALID_EMAIL') {
          yield Left(FailureMessage(Strings.kEmailInvalid));
        } else if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          yield Left(FailureMessage(Strings.kEmailAlreadyInUse));
        } else if (e.code == 'ERROR_WEAK_PASSWORD') {
          yield Left(FailureMessage(Strings.kWeakPassword));
        } else {
          yield Left(FailureMessage(e.message.toString()));
        }
      } else
        yield Left(FailureMessage(e.toString()));
    }
  }
}

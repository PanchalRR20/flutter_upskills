
import 'package:upskill_practices/features/authentication/domain/usecases/login_case.dart';

abstract class LoginDataSource{

  Future<String> loginCall(LoginParams params);

}
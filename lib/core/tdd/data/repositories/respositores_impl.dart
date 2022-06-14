import 'package:dartz/dartz.dart';

import '../../../base/base_failures.dart';
import '../../domain/repositories/repositories.dart';
import '../datasource/local_src.dart';

class DemoRepositoryImpl extends DemoRepository {
  DemoLocalSrc demoLocalSrc;

  DemoRepositoryImpl(this.demoLocalSrc);

  Stream<Either<Failure, String>> doSomething() async* {
    try {
      var data = await demoLocalSrc.doSomething();
      yield Right(data);
    } catch (e) {
      yield Left(FailureMessage(e.toString()));
    }
  }
}

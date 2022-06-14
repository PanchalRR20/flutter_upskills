import 'package:dartz/dartz.dart';

import '../../../base/base_failures.dart';

abstract class DemoRepository {
  Stream<Either<Failure, String>> doSomething();
}



import 'package:dartz/dartz.dart';
import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/core/base/use_case.dart';

import '../repositories/breaking_bad_repositories.dart';

class GetSeriesListCase extends UseCase<List<dynamic>,NoParams>{
  BreakingBadRepositories badRepositories;

  GetSeriesListCase(this.badRepositories);

  @override
  Stream<Either<Failure, List<dynamic>>> callCase(NoParams params) {
   return badRepositories.getSeriesList();
  }

}

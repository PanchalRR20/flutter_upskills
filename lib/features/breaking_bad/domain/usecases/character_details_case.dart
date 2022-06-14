

import 'package:dartz/dartz.dart';
import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/core/base/use_case.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';

import '../repositories/breaking_bad_repositories.dart';

class GetCharacterDetailsCase extends UseCase<List<dynamic>,GetCharacters>{
  BreakingBadRepositories badRepositories;

  GetCharacterDetailsCase(this.badRepositories);

  @override
  Stream<Either<Failure, List<dynamic>>> callCase(GetCharacters params) {
    return badRepositories.getCharacterDetails(params);
  }

}

class GetCharacters{
  String splitNewString;
  Episodes episode;
  GetCharacters(this.splitNewString,this.episode);
}

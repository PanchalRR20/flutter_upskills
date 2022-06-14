import 'package:dartz/dartz.dart';
import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/core/base/use_case.dart';

import '../../data/model/episodes_model.dart';
import '../repositories/breaking_bad_repositories.dart';

class GetEpisodesCase extends UseCase<EpisodesWithSeason, GetEpisode> {
  BreakingBadRepositories badRepositories;

  GetEpisodesCase(this.badRepositories);

  @override
  Stream<Either<Failure, EpisodesWithSeason>> callCase(GetEpisode params) {
    return badRepositories.getEpisodes(params.params);
  }
}

class GetEpisode {
  String params;

  GetEpisode(this.params);
}

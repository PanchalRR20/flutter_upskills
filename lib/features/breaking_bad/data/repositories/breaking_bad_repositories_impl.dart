import 'package:dartz/dartz.dart';

import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/features/breaking_bad/data/datasource/breaking_bad_local_src.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';
import 'package:upskill_practices/features/breaking_bad/domain/usecases/character_details_case.dart';

import '../../domain/repositories/breaking_bad_repositories.dart';

class BreakingBadRepositoriesImpl extends BreakingBadRepositories {
  BreakingBadLocalSrc badLocalSrc;

  BreakingBadRepositoriesImpl(this.badLocalSrc);

  @override
  Stream<Either<Failure, List<dynamic>>> getSeriesList() async* {
    try {
      var list = await badLocalSrc.getSeriesList();
      yield Right(list);
    } catch (e) {
      yield Left(FailureMessage(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, EpisodesWithSeason>> getEpisodes(String selectedSeries)async* {
    try {
      var model = await badLocalSrc.getEpisodes(selectedSeries);
      yield Right(model);
    } catch (e) {
      yield Left(FailureMessage(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List>> getCharacterDetails(GetCharacters params)async* {
    try {
      var model = await badLocalSrc.getCharacterDetails(params);
      yield Right(model);
    } catch (e) {
      yield Left(FailureMessage(e.toString()));
    }
  }
}



import 'package:dartz/dartz.dart';
import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/features/breaking_bad/domain/usecases/character_details_case.dart';

import '../../data/model/episodes_model.dart';

abstract class BreakingBadRepositories{
  Stream<Either<Failure, List<dynamic>>> getSeriesList();

  Stream<Either<Failure, EpisodesWithSeason>> getEpisodes(String selectedSeries);

  Stream<Either<Failure, List<dynamic>>> getCharacterDetails(GetCharacters params);

}
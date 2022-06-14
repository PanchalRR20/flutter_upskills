

import 'package:upskill_practices/features/breaking_bad/domain/usecases/character_details_case.dart';

import '../model/episodes_model.dart';

abstract class BreakingBadLocalSrc{
  Future<List<dynamic>> getSeriesList();

  Future<EpisodesWithSeason>getEpisodes(String selectedSeries);

  Future<List<dynamic>> getCharacterDetails(GetCharacters params);

}
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';
import 'package:upskill_practices/features/breaking_bad/domain/usecases/character_details_case.dart';

import '../../../../core/retrofit/rest_client.dart';
import 'breaking_bad_local_src.dart';

class BreakingBadLocalSrcImpl extends BreakingBadLocalSrc {
  BreakingBadLocalSrcImpl();

  final DioClient _client = DioClient();

  @override
  Future<List<dynamic>> getSeriesList() async {
    var list = await _client.getSeriesList() ?? [];
    return list;
  }

  @override
  Future<EpisodesWithSeason> getEpisodes(String selectedSeries) async {
    EpisodesWithSeason withSeason = EpisodesWithSeason(episodesList: [], totalSeason: []);
    withSeason = await _client.getEpisodeList(selectedSeries);
    return withSeason;
  }

  @override
  Future<List> getCharacterDetails(GetCharacters params) async {
    var list = await _client.getCharacterListForSelectedEpisode(params.splitNewString, params.episode) ?? [];
    return list;
  }
}

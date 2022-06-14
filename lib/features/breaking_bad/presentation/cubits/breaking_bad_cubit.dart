import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/core/base/use_case.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';
import 'package:upskill_practices/features/breaking_bad/domain/usecases/character_details_case.dart';

import '../../../../core/retrofit/rest_client.dart';
import '../../domain/usecases/get_episodes_case.dart';
import '../../domain/usecases/get_series_list_case.dart';
import 'breaking_bad_states.dart';

class BreakingBadCubit extends Cubit<BreakingBadState> {
  GetSeriesListCase? getSeriesListCase;
  GetEpisodesCase? episodesCase;
  GetCharacterDetailsCase? characterDetailsCase;

  BreakingBadCubit(
      {this.getSeriesListCase, this.episodesCase, this.characterDetailsCase})
      : super(StateInitial());
  List<dynamic> episodeList = [];
  List<String> totalSeason = [];

  getSeriesList() async {
    emit(const StateLoading());
    /*try {
      final DioClient _client = DioClient();
      var list = await _client.getSeriesList();
      emit(SeriesFetchedState(list!));
    } catch (error) {
      emit(StateGeneralError(error.toString()));
    }*/
    getSeriesListCase!.callCase(NoParams()).listen((event) {
      event.fold((error) {
        emit(StateGeneralError(error.toString()));
      }, (list) {
        emit(SeriesFetchedState(list));
      });
    });
  }

  getEpisodeList(String selectedSeries) async {
    var splitNewString = selectedSeries.split(' ').join("+");
    debugPrint(splitNewString);
    emit(const StateLoading());
    episodesCase?.callCase(GetEpisode(selectedSeries)).listen((event) {
      event.fold((error) {
        emit(StateGeneralError(error.toString()));
      }, (withSeason) {
        episodeList = withSeason.episodesList;
        totalSeason = withSeason.totalSeason;
        var list = episodeList
            .where((element) => (element as Episodes).season == '1')
            .toList();
        emit(EpisodeFetchedState(list));
      });
    });

    /* try {
      final DioClient _client = DioClient();
      EpisodesWithSeason withSeason = EpisodesWithSeason(episodesList: [], totalSeason: []);
      withSeason = await _client.getEpisodeList(selectedSeries);
      episodeList = withSeason.episodesList;
      totalSeason = withSeason.totalSeason;
      var list = episodeList
          .where((element) => (element as Episodes).season == '1')
          .toList();
      emit(EpisodeFetchedState(list));
    } catch (error) {
      emit(StateGeneralError(error.toString()));
    }*/
  }

  getListFromSeason(String season) async {
    var list = episodeList
        .where((element) => (element as Episodes).season == season)
        .toList();
    emit(EpisodeFetchedState(list));
  }

  getEpisodeDetailsListWithCharacters(
      String selectedSeries, Episodes episode) async {
    var splitNewString = selectedSeries.split(' ').join("+");
    debugPrint(splitNewString);
    emit(const StateLoading());
    characterDetailsCase
        ?.callCase(GetCharacters(splitNewString, episode))
        .listen((event) {
      event.fold((error) {
        emit(StateGeneralError(error.toString()));
      }, (r) {
        emit(EpisodeCharacterDetailsState(r));
      });
    });

    /* try {
      final DioClient _client = DioClient();
      var list = await _client.getCharacterListForSelectedEpisode(
          splitNewString, episode);
      emit(EpisodeCharacterDetailsState(list!));
    } catch (error) {
      emit(StateGeneralError(error.toString()));
    }*/
  }
}

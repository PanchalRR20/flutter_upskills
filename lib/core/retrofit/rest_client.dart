// import 'package:json_annotation/json_annotation.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
//
// import '../../features/upskill_foundation/data/models/episodes_model.dart';
//
// part 'rest_client.g.dart';
//
// @RestApi(baseUrl: "https://www.breakingbadapi.com/api/")
// abstract class RestClient {
//   factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
//
//   @GET("/episodes")
//   Future<List<Episodes>> getTasks();
// }

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/character_model.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://www.breakingbadapi.com/api';

// TODO: Add methods

  Future<List<dynamic>?> getSeriesList() async {
    List<dynamic> list = [];
    try {
      Response episodes = await _dio.get(_baseUrl + '/episodes');
      list = episodes.data
          .map((dynamic i) => Episodes.fromJson(i as Map<String, dynamic>))
          .toList();
      var idSet = <String>{};
      var distinctList = [];
      for (var d in list) {
        if (idSet.add(d.series)) {
          distinctList.add(d);
        }
      }
      return distinctList;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
      return null;
    }
  }

  Future<EpisodesWithSeason> getEpisodeList(String series) async {
    List<dynamic> list = [];
    try {
      Response episodes =
          await _dio.get(_baseUrl + '/episodes?series=${series}');
      List<String> totalSeasonSet = [];
      list = episodes.data.map((dynamic i) {
        if (!totalSeasonSet.contains(i['season'].toString().trim())) {
          print("Season :: ${i['season']}");
          totalSeasonSet.add(i['season'].toString().trim());
        }
        return Episodes.fromJson(i as Map<String, dynamic>);
      }).toList();
      print(totalSeasonSet);

      return EpisodesWithSeason.onSuccess(totalSeason: totalSeasonSet,episodesList: list);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        return EpisodesWithSeason.onError(errorMsg: e.response!.statusMessage.toString() );
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        return EpisodesWithSeason.onError(errorMsg: e.message.toString());
      }

    }
  }

  Future<List<dynamic>?> getCharacterListForSelectedEpisode(
      String series, Episodes episode) async {
    List<dynamic> list = [];
    try {
      Response characters =
          await _dio.get(_baseUrl + '/characters?category=${series}');
      list = characters.data
          .map(
              (dynamic i) => CharacterModel.fromJson(i as Map<String, dynamic>))
          .toList();
      List newList = [];
      if (episode.characters != null) {
        for (var element1 in list) {
          episode.characters?.forEach((element) {
            if (element == (element1 as CharacterModel).name) {
              newList.add(element1);
            }
          });
        }
      }
      print(newList);
      return newList;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
      return null;
    }
  }
}

class Episodes {
  int? episodeId;
  String? title;
  String? season;
  String? airDate;
  List<String>? characters;
  String? episode;
  String? series;

  Episodes(
      {this.episodeId,
      this.title,
      this.season,
      this.airDate,
      this.characters,
      this.episode,
      this.series});

  Episodes.fromJson(Map<String, dynamic> json) {
    episodeId = json['episode_id'];
    title = json['title'];
    season = json['season'];
    airDate = json['air_date'];
    characters = json['characters'].cast<String>();
    episode = json['episode'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['episode_id'] = this.episodeId;
    data['title'] = this.title;
    data['season'] = this.season;
    data['air_date'] = this.airDate;
    data['characters'] = this.characters;
    data['episode'] = this.episode;
    data['series'] = this.series;
    return data;
  }
}

class EpisodesWithSeason {
  List<dynamic> episodesList;
  late List<String> totalSeason;
  String error;

  EpisodesWithSeason(
      {required this.episodesList,required this.totalSeason, this.error = '', });

  static EpisodesWithSeason onError({required String errorMsg}) {
    return EpisodesWithSeason(
        episodesList: [], totalSeason: [], error: errorMsg);
  }

  static EpisodesWithSeason onSuccess(
      {required List<dynamic> episodesList, required List<String> totalSeason}) {
    return EpisodesWithSeason(
        episodesList: episodesList, totalSeason: totalSeason, error: '');
  }
}

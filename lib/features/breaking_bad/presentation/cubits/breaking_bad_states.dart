import 'package:equatable/equatable.dart';

import '../../data/model/episodes_model.dart';

abstract class BreakingBadState extends Equatable {
  const BreakingBadState();
}

class StateInitial extends BreakingBadState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateGeneralError extends BreakingBadState {
  String msg;

  StateGeneralError(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}

class StateLoading extends BreakingBadState {
  const StateLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SeriesFetchedState extends BreakingBadState {
  List<dynamic> seriesList;

  @override
  List<Object?> get props => [seriesList];

  SeriesFetchedState(this.seriesList);
}
class EpisodeFetchedState extends BreakingBadState {
  List<dynamic> episodeList;

  @override
  List<Object?> get props => [episodeList];

  EpisodeFetchedState(this.episodeList);
}

class EpisodeCharacterDetailsState extends BreakingBadState {
  List<dynamic> characterList;

  @override
  List<Object?> get props => [characterList];

  EpisodeCharacterDetailsState(this.characterList);
}

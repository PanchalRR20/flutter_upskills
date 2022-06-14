import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/character_model.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';
import '../../../../core/widgets/center_circular_widget.dart';
import '../cubits/breaking_bad_cubit.dart';
import '../cubits/breaking_bad_states.dart';

class EpisodeDetailWidget extends StatefulWidget {
  String series = '';
  Episodes episode;

  EpisodeDetailWidget(this.series, this.episode);

  @override
  State<StatefulWidget> createState() {
    return _EpisodeDetailWidgetState();
  }
}

class _EpisodeDetailWidgetState extends State<EpisodeDetailWidget> {
  late BreakingBadCubit _breakingBadCubit;
  List<dynamic> characters = [];

  @override
  void initState() {
    _breakingBadCubit = BlocProvider.of<BreakingBadCubit>(context);
    _breakingBadCubit.getEpisodeDetailsListWithCharacters(
        widget.series, widget.episode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Season ${widget.episode.season} : ${widget.series} ')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: bindSeries(),
      ),
    );
  }

  Widget bindSeries() {
    return BlocBuilder<BreakingBadCubit, BreakingBadState>(
      builder: (context, state) {
        if (state is EpisodeCharacterDetailsState) {
          characters = state.characterList;
        }

        if (state is StateLoading) {
          return const CenterCircularWidget();
        } else {
          return bindGrid();
        }
      },
    );
  }

  Widget bindGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Episode ${widget.episode.episode.toString()} : ${widget.episode.title.toString()}',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(characters.length, (index) {
              var model = (characters[index] as CharacterModel);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.black87,
                  child: Container(
                    //color: Colors.black87,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 6,
                            child: Container(
                              color: Colors.black54,
                              child: Image.network(
                                model.img ?? "",
                                fit: BoxFit.contain,
                                //height: 120,
                                //width: 120,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                              flex: 2,
                              child: RichText(
                                  text: TextSpan(
                                      text:
                                          '${model.name} (${model.nickname})'))),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

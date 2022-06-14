import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';

import '../../../../core/utils/navigation_helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/center_circular_widget.dart';
import '../cubits/breaking_bad_cubit.dart';
import '../cubits/breaking_bad_states.dart';

class EpisodeListWidget extends StatefulWidget {
  String series = '';

  EpisodeListWidget(this.series);

  @override
  State<StatefulWidget> createState() {
    return _EpisodeListWidgetState();
  }
}

class _EpisodeListWidgetState extends State<EpisodeListWidget> {
  late BreakingBadCubit _breakingBadCubit;
  List<dynamic> episodes = [];
  String selectedSeason = '1';

  @override
  void initState() {
    _breakingBadCubit = BlocProvider.of<BreakingBadCubit>(context);
    _breakingBadCubit.getEpisodeList(widget.series);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: bindSeries(),
    );
  }

  Widget bindSeries() {
    return BlocBuilder<BreakingBadCubit, BreakingBadState>(
      builder: (context, state) {
        if (state is EpisodeFetchedState) {
          episodes = state.episodeList;
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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.black12,
          height: 200,
          child: Center(child: Text(widget.series,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 10, right: 20),
          child: DropdownButton(
              value: selectedSeason,
              items: _breakingBadCubit.totalSeason.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Season $items'),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                selectedSeason = value.toString();
                _breakingBadCubit.getListFromSeason(value.toString());
              }),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  var episode = jsonEncode(episodes[index] as Episodes);
                  NavigationHelper(context)
                      .episodeDetailPage(widget.series, episode);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: Container(
                      height: 100,
                      //margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Row(
                          children: [
                            Flexible(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${(episodes[index] as Episodes).episode}. ${(episodes[index] as Episodes).title} ',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    (episodes[index] as Episodes).airDate ?? "",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

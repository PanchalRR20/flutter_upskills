import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';

import '../../../../core/utils/navigation_helper.dart';
import '../../../../core/widgets/center_circular_widget.dart';
import '../cubits/breaking_bad_cubit.dart';
import '../cubits/breaking_bad_states.dart';

class BreakingBadWidget extends StatefulWidget {
  const BreakingBadWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BreakingBadWidgetState();
  }
}

class _BreakingBadWidgetState extends State<BreakingBadWidget> {
  late BreakingBadCubit _breakingBadCubit;
  List<dynamic> series = [];

  @override
  void initState() {
    _breakingBadCubit = BlocProvider.of<BreakingBadCubit>(context);
    _breakingBadCubit.getSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: bindSeries(),
    );
  }

  Widget bindSeries() {
    return BlocBuilder<BreakingBadCubit, BreakingBadState>(
      builder: (context, state) {
        if (state is SeriesFetchedState) {
          series = state.seriesList;
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
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(series.length, (index) {
        return GestureDetector(
          onTap: () {
            NavigationHelper(context)
                .episodeListPage((series[index] as Episodes).series ?? "");
          },
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (series[index] as Episodes).series ?? "",
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

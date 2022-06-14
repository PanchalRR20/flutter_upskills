import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/features/landing/presentation/cubits/landing_cubit.dart';

import '../../../core/utils/image_path.dart';
import '../../../core/utils/navigation_helper.dart';
import '../../../core/utils/route_name.dart';
import 'cubits/landing_cubit_state.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LandingWidgetState();
  }
}

class LandingWidgetState extends State<LandingWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
          child: BlocListener<LandingCubit, LandingCubitState>(
            listener: (context, state) {
              if (state is NavigateToNextScreen) {
                if(state.routeName == RouteName.login){
                  NavigationHelper(context).loginPage();
                } else {
                  NavigationHelper(context).dashboardPage();
                }
              }
            },
            child: Center(
              child: Image.asset(
                ImagePath.kSplash,
                fit: BoxFit.contain,
              ),
            ),
          )),
      backgroundColor: Colors.black,
    );
  }
}

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:upskill_practices/core/utils/route_name.dart';

import '../../application.dart';

class NavigationHelper {
  BuildContext context;

  NavigationHelper(this.context);

  //Login
  void loginPage({bool closeDrawer = false, bool clearStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (closeDrawer) closeTheDrawer(context);
    Application.router.navigateTo(
      context,
      RouteName.login,
      transition: TransitionType.fadeIn,
      clearStack: clearStack,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  //DashBoard
  void dashboardPage({bool closeDrawer = false, bool clearStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (closeDrawer) closeTheDrawer(context);
    Application.router.navigateTo(
      context,
      RouteName.dashboard,
      transition: TransitionType.fadeIn,
      clearStack: clearStack,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  //Foundation
  void foundationSeriesPage(
      {bool closeDrawer = false, bool clearStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (closeDrawer) closeTheDrawer(context);
    Application.router.navigateTo(
      context,
      RouteName.breakingBadSeries,
      transition: TransitionType.fadeIn,
      clearStack: clearStack,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  //Foundation
  void episodeListPage(String series) {
    Application.router.navigateTo(
      context,
      '${RouteName.episodeList}/$series',
      transition: TransitionType.fadeIn,
      clearStack: false,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  void episodeDetailPage(String series,String json) {
    Application.router.navigateTo(
      context,
      '${RouteName.episodeDetailPage}/$series/$json',
      transition: TransitionType.fadeIn,
      clearStack: false,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }



  void animationAlignPage({bool closeDrawer = false, bool clearStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (closeDrawer) closeTheDrawer(context);
    Application.router.navigateTo(
      context,
      RouteName.animatedAlignWidget,
      transition: TransitionType.fadeIn,
      clearStack: clearStack,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }


  void animationBuilderPage({bool closeDrawer = false, bool clearStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (closeDrawer) closeTheDrawer(context);
    Application.router.navigateTo(
      context,
      RouteName.animationBuilderWidget,
      transition: TransitionType.fadeIn,
      clearStack: clearStack,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  void animationContainerPage({bool closeDrawer = false, bool clearStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (closeDrawer) closeTheDrawer(context);
    Application.router.navigateTo(
      context,
      RouteName.animatedContainerWidget,
      transition: TransitionType.fadeIn,
      clearStack: clearStack,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }

  void adminPage({bool closeDrawer = false, bool clearStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (closeDrawer) closeTheDrawer(context);
    Application.router.navigateTo(
      context,
      RouteName.admins,
      transition: TransitionType.fadeIn,
      clearStack: clearStack,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }


  void closeTheDrawer(BuildContext context) {
    //Scaffold.of(context).openEndDrawer();
  }
}

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/core/utils/route_name.dart';
import 'package:upskill_practices/features/authentication/presentation/pages/login_screen.dart';
import 'package:upskill_practices/features/breaking_bad/data/model/episodes_model.dart';
import 'package:upskill_practices/features/landing/presentation/landing_widget.dart';
import 'application.dart';
import 'core/base/base_bloc.dart';
import 'core/utils/strings.dart';
import 'core/utils/upskill_theme.dart';
import 'features/authentication/presentation/cubits/login_cubit.dart';
import 'features/breaking_bad/presentation/cubits/breaking_bad_cubit.dart';
import 'features/breaking_bad/presentation/pages/breaking_bad_page.dart';
import 'features/breaking_bad/presentation/widgets/episode_detail_widget.dart';
import 'features/breaking_bad/presentation/widgets/episode_list_widget.dart';
import 'features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'features/dashboard/presentation/widgets/dashboard_widget.dart';
import 'features/flutter_animations/animate_crosss_fade_widget.dart';
import 'features/flutter_animations/animated_align_widget.dart';
import 'features/flutter_animations/animated_container_widget.dart';
import 'features/flutter_animations/animation_builder.dart';
import 'features/flutter_animations/animation_widget.dart';
import 'features/flutter_animations/decoration_transition_widget.dart';
import 'features/flutter_animations/hero_animation.dart';
import 'features/flutter_animations/modal_barrier_widget.dart';
import 'features/flutter_animations/opacity.dart';
import 'features/flutter_animations/positioned_animation_widget.dart';
import 'features/flutter_animations/positioned_class.dart';
import 'features/flutter_animations/rotation_transition_widget.dart';
import 'features/flutter_animations/scale_transition_widget.dart';
import 'features/flutter_animations/size_transition_widget.dart';
import 'features/flutter_animations/size_widget.dart';
import 'features/flutter_animations/slide_page_demo.dart';
import 'features/flutter_animations/slide_transition_widget.dart';
import 'features/landing/presentation/cubits/landing_cubit.dart';
import 'features/authentication/injection_container_login.dart' as loginSl;
import 'features/landing/injection_container_landing.dart' as landingSl;
import 'features/dashboard/injection_container_dashboard.dart' as dashboardSl;
import 'features/breaking_bad/injection_container_breaking_bad.dart'
    as breakingBadSl;
import 'features/user_details/injection_container_user_details.dart' as adminSl;
import 'features/user_details/presentation/cubit/user_details_cubit.dart';
import 'features/user_details/presentation/widgets/admin_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final emulatorHost =
  // (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
  //     ? '10.0.2.2'
  //     : 'localhost';
  // await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);
  await landingSl.init();
  await loginSl.init();
  await dashboardSl.init();
  await breakingBadSl.init();
  await adminSl.init();

  // Create the router.
  FluroRouter router = FluroRouter();
  Application.router = router;

  //0. Initial
  router.define(RouteName.initial, handler: Handler(
    handlerFunc: (context, parameters) {
      return BlocProvider(
        create: (_) => landingSl.landingSl<LandingCubit>()..loadSplash(),
        child: const LandingWidget(),
      );
    },
  ));

  //Login
  router.define(RouteName.login, handler: Handler(
    handlerFunc: (context, parameters) {
      return BlocProvider(
        create: (_) => loginSl.loginSl<LoginCubit>(),
        child: LoginWidget(),
      );
    },
  ));

  //DashBoard
  router.define(RouteName.dashboard, handler: Handler(
    handlerFunc: (context, parameters) {
      return BlocProvider(
        create: (_) => dashboardSl.dashboardSl<DashboardCubit>(),
        child: const DashBoardWidget(),
      );
    },
  ));

  //Admins
  router.define(RouteName.admins, handler: Handler(
    handlerFunc: (context, parameters) {
      return BlocProvider(
        create: (_) => adminSl.adminSl<UserDetailCubit>(),
        child: const AdminWidget(),
      );
    },
  ));

  //breakingBadSeries
  router.define(RouteName.breakingBadSeries, handler: Handler(
    handlerFunc: (context, parameters) {
      return BlocProvider(
        create: (_) => breakingBadSl.badSl<BreakingBadCubit>(),
        child: const BreakingBadPage(),
      );
    },
  ));

  //Episodes
  router.define('${RouteName.episodeList}/:series', handler: Handler(
    handlerFunc: (context, parameters) {
      var selectedSeries = parameters['series']![0];
      return BlocProvider(
        create: (_) => breakingBadSl.badSl<BreakingBadCubit>(),
        child: EpisodeListWidget(selectedSeries),
      );
    },
  ));

  //Characters
  router.define('${RouteName.episodeDetailPage}/:series/:json',
      handler: Handler(
    handlerFunc: (context, parameters) {
      var selectedSeries = parameters['series']![0];
      var jsonMap = jsonDecode(parameters['json']![0]);
      Episodes episodes = Episodes();
      episodes = Episodes.fromJson(jsonMap);
      return BlocProvider(
        create: (_) => breakingBadSl.badSl<BreakingBadCubit>(),
        child: EpisodeDetailWidget(selectedSeries, episodes),
      );
    },
  ));

  router.define(RouteName.animatedAlignWidget, handler: Handler(
    handlerFunc: (context, parameters) {
      return const AnimatedAlignWidget();
    },
  ));
  router.define(RouteName.animationBuilderWidget, handler: Handler(
    handlerFunc: (context, parameters) {
      return const AnimationBuilderWidget();
    },
  ));

  router.define(RouteName.animatedContainerWidget, handler: Handler(
    handlerFunc: (context, parameters) {
      //return const AnimatedContainerWidget();
      return const AnimationCrossFadeWidget();
      //return AnimatedDemoScreen();
      // return LogoFade();
      // return PositionedWidget();
      //return AnimatedSizeWidget();
      //return AnimationWidgetTst();
      //return DecorationTransitionWidgetTst();
      //return HeroAnimationWidget();
      //return PositionedAnimationWidget();
      //return RotationTransitionWidget();
      //return ScaleTransitionWidget();
      //return SizeTransitionWidget();
      //return SlideTransitionWidget();
      //return Page1();
    },
  ));

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.kAppName,
      theme: UpskillTheme.buildLightTheme(),
      darkTheme: UpskillTheme.buildDarkTheme(),
      initialRoute: '/',
      //RouteName.splash , RouteName.initial
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],*/
      supportedLocales: const [Locale('en', 'AU')],
      locale: const Locale('en', 'AU'),
    );
    /*final GoRouter _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: RouteName.initial,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (_) => LandingCubit()..loadSplash(),
              child: const LandingWidget(),
            );
          },
        ),
        GoRoute(
          path: RouteName.login,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (_) => LoginCubit(),
              child: LoginWidget(),
            );
          },
        ),
        GoRoute(
          path: RouteName.dashboard,
          builder: (BuildContext context, GoRouterState state) {
            return const DashBoardWidget();
          },
        ),
      ],
    );

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: "TEST",
      theme: UpskillTheme.buildLightTheme(),
      darkTheme: UpskillTheme.buildDarkTheme(),
      supportedLocales: const [Locale('en', 'AU')],
      locale: const Locale('en', 'AU'),
    );*/
  }
}

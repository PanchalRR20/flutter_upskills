import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upskill_practices/core/utils/common.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/device_size.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../authentication/presentation/cubits/login_cubit.dart';
import '../../../authentication/presentation/cubits/login_cubit_states.dart';
import '../core_widgets/custom_bottom_list_widget.dart';
import '../cubit/dashboard_cubit.dart';

List<String> drawerList = [
  Strings.kFoundation,
  Strings.kResponsiveUI,
  Strings.kActiveUser,
  'BBBBBBBBBB',
  'CCCCCCCCCC',
];

class DashBoardWidget extends StatefulWidget {
  const DashBoardWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DashBoardWidgetState();
  }
}

class DashBoardWidgetState extends State<DashBoardWidget> {
  late DashboardCubit _dashboardCubit;

  late bool useTabs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashboardCubit = BlocProvider.of<DashboardCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    useTabs = MediaQuery.of(context).size.width < FormFactor.tablet;
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.kDashboard)),
      drawer: setDrawer(),
      bottomNavigationBar: useTabs
          ? SafeArea(
              child: Wrap(
              children: [
                TabMenu(),
              ],
            ))
          : null,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              Strings.kDashboard,
              style: TextStyle(fontSize: 18),
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black,
              ),
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  NavigationHelper(context).animationContainerPage();
                },
                child: const Text("Animations"))
          ],
        ),
      ),
    );
  }

  Widget setDrawer() {
    return Drawer(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 80.0,
                        height: 80.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(
                              text: 'abc@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: kColorWhite, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                ),
                if (!useTabs) ...getMainMenuChildren(context, false),
                BlocProvider(
                  create: (_) => LoginCubit(),
                  child: BlocListener<LoginCubit, LoginCubitState>(
                    listener: (context, state) {
                      if (state is LogOutState) {
                        NavigationHelper(context)
                            .loginPage(closeDrawer: true, clearStack: true);
                      }
                    },
                    child: BlocBuilder<LoginCubit, LoginCubitState>(
                        builder: (context, snapshot) {
                      return ListTile(
                        title: RichText(
                          text: const TextSpan(
                              text: Strings.kLogout,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        onTap: () async {
                          BlocProvider.of<LoginCubit>(context).logOut();
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrap all the main menu buttons in Expanded() so they fill up the screen horizontally
    List<Expanded> tabButtons = getMainMenuChildren(context, true, endIndex: 2)
        .map((btn) => Expanded(child: btn))
        .toList();

    List<Expanded> tabButtons2 = getMainMenuChildren(
      context,
      true,
      startIndex: 3,
    ).map((btn) => Expanded(child: btn)).toList();
    return Column(
      children: [
        // Top Divider
        Container(width: double.infinity, height: 1, color: Colors.blue),
        // Tab buttons
        Row(children: tabButtons),
        Row(children: tabButtons2),
      ],
    );
  }
}

List<Widget> getMainMenuChildren(BuildContext context, bool textAlignCenter,
    {int startIndex = 0, int endIndex = 0}) {
  List<Widget> widgetList = [];
  for (int i = startIndex; i < drawerList.length - endIndex; i++) {
    var e = drawerList[i];
    widgetList.add(SelectedPageButton(
      isSelected: false,
      label: e.toString(),
      onPressed: () {
        navigationToPages(context, e.toString());
      },
      textAlignCenter: textAlignCenter,
    ));
  }
  return widgetList;
}

navigationToPages(BuildContext context, String selectedTab) {
  switch (selectedTab) {
    case Strings.kFoundation:
      NavigationHelper(context).foundationSeriesPage(clearStack: false,closeDrawer: true);
      break;

      case Strings.kActiveUser:
      NavigationHelper(context).adminPage(clearStack: false,closeDrawer: true);
      break;
  }
}

/*

class SavedAttachments {
  String? attachmentName;
  String? price;
  String? nameID;

  SavedAttachments(
      {this.attachmentName = '', this.price = '', this.nameID = ''});

  Map<String, dynamic> toMap() {
    return {
      "attachmentName": attachmentName,
      "price": price,
      "nameID": nameID,
    };
  }

  SavedAttachments copyWith({
    String? attachmentName,
    String? nameID,
    String? price,
  }) =>
      SavedAttachments(
        attachmentName: attachmentName ?? this.attachmentName,
        nameID: nameID ?? this.nameID,
        price: price ?? this.price,
      );
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(10, 10);

  final double x, y;

  Map<String, dynamic> toMap() {
    return {
      "x": x,
      "y": y,
    };
  }

  const ImmutablePoint(this.x, this.y);
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () {
      print(_cache);
      return Logger._internal(name);
    });
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

class Student {
  static final Student _student = Student._internal();
  String? name;

  Student._internal();

  factory Student() {
    return _student;
  }
}
*/

/*
checkConstructors() {
  //COPY WITH
  // SavedAttachments d1=SavedAttachments(attachmentName: 'dhaval',price: "20");
  // SavedAttachments d2= d1.copyWith(attachmentName: "Ravina");
  // print("d1 :: ${d1.toMap()}");
  // print("d2 :: ${d2.toMap()}");

  //CONST STATIC
  // ImmutablePoint immutablePoint = ImmutablePoint.origin;
  // print(immutablePoint.toMap());
  // var logger = Logger('UI');
  // logger.log('Button clicked');
  //
  // var logMap = {'name': 'UI'};
  // ImmutablePoint m1 = const ImmutablePoint(1, 2);
  // ImmutablePoint m2 = const ImmutablePoint(3, 4);
  // print(m1.x);
  // //print(m1.toMap());
  // print(m2.x);
  //
  // var logger = Logger('UI 1');
  // var logger2 = Logger('UI 2');
  // print(logger.name);
  // print(logger2.name);
  Student student = Student();
  student.name = "Anil Sharma";

  Student student2 = Student();
  student2.name = "Kapil Sharma";
  print(student.name);
  print(student2.name);

  // var loggerJson = Logger.fromJson(logMap);
}*/

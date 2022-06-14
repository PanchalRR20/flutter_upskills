// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:upskill_practices/features/authentication/presentation/cubits/login_cubit.dart';
// import 'package:upskill_practices/features/authentication/presentation/cubits/login_cubit_states.dart';
//
// import '../utils/colors.dart';
// import '../utils/common.dart';
// import '../utils/navigation_helper.dart';
// import '../utils/strings.dart';
//
// class DrawerWidget extends StatelessWidget {
//
//   String widgetTag = '';
//
//   DrawerWidget(this.widgetTag, {Key? key}) : super(key: key);
//    List<String> drawerList = Common().getDrawerList();
//   @override
//   Widget build(BuildContext context) {
//     return setDrawer(context);
//   }
//
//   Widget setDrawer(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           Flexible(
//             child: ListView(
//               // Important: Remove any padding from the ListView.
//               padding: EdgeInsets.zero,
//               children: <Widget>[
//                 DrawerHeader(
//                   padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     //mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                           width: 150.0,
//                           height: 80.0,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.rectangle,
//                           ),
//                           child: const Icon(Icons.email)),
//                       Flexible(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: RichText(
//                             text: TextSpan(
//                               text: 'abc@gmail.com',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .subtitle2!
//                                   .copyWith(color: kColorWhite, fontSize: 12),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 2,
//                       ),
//                     ],
//                   ),
//                   decoration: const BoxDecoration(
//                     color: kColorAccent,
//                   ),
//                 ),
//                 ExpansionTile(
//                   initiallyExpanded: false,
//                   title: RichText(
//                     text: const TextSpan(
//                         text: Strings.kCourses,
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold)),
//                   ),
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, bottom: 10),
//                       child: ListView.builder(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 0.0, vertical: 0.0),
//                           itemCount: drawerList.length,
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: GestureDetector(
//                                   onTap: () async {
//                                     childOnPress(
//                                         index: index,
//                                         context: context,
//                                         widgetTag: widgetTag);
//                                   },
//                                   child: RichText(
//                                     text: TextSpan(
//                                         text: drawerList[index],
//                                         style: TextStyle(color: Colors.black)),
//                                   )),
//                             );
//                           }),
//                     )
//                   ],
//                 ),
//                 BlocProvider(
//                   create: (_) => LoginCubit(),
//                   child: BlocListener<LoginCubit,LoginCubitState>(
//                     listener: (context, state) {
//                       if(state is LogOutState){
//                         NavigationHelper(context).loginPage(closeDrawer: true, clearStack: true);
//                       }
//                     },
//                     child: BlocBuilder<LoginCubit,LoginCubitState>(
//                       builder: (context, snapshot) {
//                         return ListTile(
//                           title: RichText(
//                             text: const TextSpan(
//                                 text: Strings.kLogout,
//                                 style: TextStyle(
//                                     color: Colors.black, fontWeight: FontWeight.bold)),
//                           ),
//                           onTap: () async {
//                             BlocProvider.of<LoginCubit>(context).logOut();
//                           },
//                         );
//                       }
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void closeDrawer(BuildContext context) {
//     Scaffold.of(context).openEndDrawer();
//   }
//
//   childOnPress(
//       {required int index,
//       required String widgetTag,
//       required BuildContext context}) {
//     switch (drawerList[index]) {
//       case Strings.kFoundation:
//         if (widgetTag != Strings.kFoundation) {
//           NavigationHelper(context)
//               .foundationSeriesPage(closeDrawer: true, clearStack: false);
//         } else {
//           closeDrawer(context);
//         }
//
//         break;
//     }
//   }
// }

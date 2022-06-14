import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../../../../core/utils/route_name.dart';
import '../../../../core/widgets/progress_dialog.dart';
import '../cubits/login_cubit.dart';
import '../cubits/login_cubit_states.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginWidgetState();
  }
}

class _LoginWidgetState extends State<LoginWidget> with WidgetsBindingObserver {
  late GlobalKey<FormState> loginForm;

  TextEditingController emailController = TextEditingController(text: 'ravina.panchal@radixweb.com');
  TextEditingController passwordController = TextEditingController(text: "123456");
  late LoginCubit _loginCubit;
  late Size screenSize;
  late bool useVerticalLayout;
  late bool hideDetailPanel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginForm = GlobalKey<FormState>();
    _loginCubit = BlocProvider.of<LoginCubit>(context);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    useVerticalLayout = screenSize.width < screenSize.height;
    hideDetailPanel = screenSize.shortestSide < 250;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light,
          child: BlocListener<LoginCubit, LoginCubitState>(
              bloc: _loginCubit,
              listener: (BuildContext context, state) {
                if (state is LoginSuccessState) {
                  ProgressDialog.hideLoadingDialog(context);
                  Common.showToast(msg: "Login Successful");
                  NavigationHelper(context).dashboardPage(clearStack: true);
                  /*final router = GoRouter.of(context);
              router.go(RouteName.dashboard);*/
                } else if (state is LoginStateError) {
                  ProgressDialog.hideLoadingDialog(context);
                  Common.showToast(msg: state.msg);
                } else if(state is StateProgressLoading){
                  ProgressDialog.showLoadingDialog(context);
                }
              },
              child: BlocBuilder<LoginCubit, LoginCubitState>(
                  bloc: _loginCubit,
                  builder: (context, state) {
                    return bindWidget();
                  }))),
    );
  }

  Widget bindWidget() {
    return SafeArea(
      child: Form(
        key: loginForm,
        child: Flex(
          direction: useVerticalLayout?Axis.vertical:Axis.horizontal,
          children: [
            if (hideDetailPanel == false) ...[
              Flexible(child: _LoginDetailPanel()),
            ],
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(child: loginFormWidget()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bindLogo() {
    return const Icon(
      Icons.restaurant,
      size: 50,
    );
  }

  Widget loginFormWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
              validator: (val) {
                if (val == "") {
                  return "Enter Email";
                } else {
                  return null;
                }
              },
              controller: emailController,
              decoration: const InputDecoration(hintText: "Enter email")),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (val) {
                if (val == "") {
                  return "Enter Password";
                } else {
                  return null;
                }
              },
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Enter password")),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () async {
                if (loginForm.currentState!.validate()) {
                  _loginCubit.logInUser(emailController.text.trim(), passwordController.text.trim());
                } else {
                  loginForm.currentState!.validate();
                }
              },
              child: const Text("LOG IN")),
        ],
      ),
    );
  }

// @override
// void didChangeAppLifecycleState(AppLifecycleState state) async {
//   if (state == AppLifecycleState.resumed) {
//     final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
//     if( data!.link != null ) {
//       handleLink(data.link);
//     }
//     FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
//
//     // FirebaseDynamicLinks.instance.onLink(
//     //     onSuccess: (PendingDynamicLinkData dynamicLink) async {
//     //       final Uri deepLink = dynamicLink.link;
//     //       handleLink(deepLink);
//     //     }, onError: (OnLinkErrorException e) async {
//     //   print('onLinkError');
//     //   print(e.message);
//     // });
//     dynamicLinks.onLink.listen((dynamicLinkData) {
//       print(dynamicLinkData.link.path);
//       handleLink(dynamicLinkData.link);
//       // Navigator.pushNamed(context, dynamicLinkData.link.path);
//     }).onError((error) {
//       print('onLink error');
//       print(error.message);
//     });
//   }
// }
//
// void handleLink(Uri link) async {
//   if (link != null) {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     var user = (await _auth.signInWithEmailLink(
//       email: emailController.text,
//       emailLink: link.toString(),
//     )).user;
//     print(user);
//   }
// }
}

class _LoginDetailPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        color: Colors.grey.shade300,
        child: Text(
          "UpSkill 2022",
          style: TextStyle(fontSize: 64),
          textAlign: TextAlign.center,
        ),
      );
}

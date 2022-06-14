import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/strings.dart';

class CenterCircularWidget extends StatelessWidget {
  const CenterCircularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ShowErrorWidget extends StatefulWidget {
  String msg;

  ShowErrorWidget({this.msg = Strings.kSomethingWentWrong});

  @override
  State<ShowErrorWidget> createState() => _ShowErrorWidgetState();
}

class _ShowErrorWidgetState extends State<ShowErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.msg));
  }
}

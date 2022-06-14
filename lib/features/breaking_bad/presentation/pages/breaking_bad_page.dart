import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upskill_practices/features/breaking_bad/presentation/widgets/breaking_bad_widget.dart';

class BreakingBadPage extends StatefulWidget {
  const BreakingBadPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BreakingBadePageState();
  }
}

class _BreakingBadePageState extends State<BreakingBadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Breaking Bad"),),
        body: const BreakingBadWidget()

    );
  }
}

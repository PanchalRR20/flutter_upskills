import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationCrossFadeWidget extends StatefulWidget {
  const AnimationCrossFadeWidget({Key? key}) : super(key: key);

  @override
  State<AnimationCrossFadeWidget> createState() =>
      _AnimationCrossFadeWidgetState();
}

class _AnimationCrossFadeWidgetState extends State<AnimationCrossFadeWidget> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 3),
      firstChild: GestureDetector(
          onTap: () {
            setState(() {
              _first = !_first;
            });
          },
          child: const FlutterLogo(
              style: FlutterLogoStyle.horizontal, size: 100.0)),
      secondChild: GestureDetector(
          onTap: () {
            setState(() {
              _first = !_first;
            });
          },
          child:
              const FlutterLogo(style: FlutterLogoStyle.markOnly, size: 100.0)),
      crossFadeState:
          _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

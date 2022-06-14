import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationBuilderWidget extends StatefulWidget {
  const AnimationBuilderWidget({Key? key}) : super(key: key);

  @override
  State<AnimationBuilderWidget> createState() => _AnimationBuilderWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimationBuilderWidgetState extends State<AnimationBuilderWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //   animation: _controller,
    //   child: Container(
    //     width: 200.0,
    //     height: 200.0,
    //     color: Colors.green,
    //     child: const Center(
    //       child: Text('Whee!'),
    //     ),
    //   ),
    //   builder: (BuildContext context, Widget? child) {
    //     return Transform.rotate(
    //       angle: _controller.value * 2.0 * math.pi,
    //       child: child,
    //     );
    //   },
    // );

    return AnimatedBuilder(
        animation: _controller,
        child: Container(height: 200,width: 200,color: Colors.grey,),
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * math.pi,
            child: child,
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationComponent extends StatefulWidget {
  const AnimationComponent({Key? key}) : super(key: key);

  @override
  State<AnimationComponent> createState() => _AnimationComponentState();
}

class _AnimationComponentState extends State<AnimationComponent>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animation/create_animation.json',
      controller: _controller,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}

import 'package:animate_navigator_transition_do/animate_navigator_transition_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../screens/home_page.dart';

class HomeHandleScreen extends StatefulWidget {
  const HomeHandleScreen({Key? key}) : super(key: key);

  @override
  _HomeHandleScreenState createState() => _HomeHandleScreenState();
}

class _HomeHandleScreenState extends State<HomeHandleScreen>
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animation/create_animation.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              _controller
                ..duration = composition.duration
                ..forward();
            },
          ),
          const SizedBox(
            height: 35.0,
          ),
          const Text('Profile'),
          const SizedBox(
            height: 30.0,
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 25,
            endIndent: 25,
            color: Colors.teal,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            'Vous n\'avez pas de profile',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 17)),
            onPressed: () {
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const HomePage(),
                  transitionDuration:  const Duration(milliseconds: 300),
                  transitionsBuilder: (_, animation, __, child) => SlideTransition(
                      position:
                      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                          .animate(animation),
                      child: child))
              );

            },
            child: const Text('Creer un profile'),
          ),
        ],
      ),
    );
  }
}

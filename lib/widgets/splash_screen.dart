import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'bottom_tab_bar.dart';

import '../services/auth/auth_bloc.dart';
import '../screens/auth/login_page_new.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          FirebaseAuth.instance.authStateChanges().listen((user) {
            Widget screen = const LoginPage();
            if (user != null) {
              screen = const BottomTabBarController();
            }

            if (mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(providers: [
                            BlocProvider<AuthBloc>(
                                create: (context) => AuthBloc()),
                          ], child: screen)),
                  (route) => false);
            }
          })
        });

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
            'assets/animation/loading.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              _controller
                ..duration = composition.duration
                ..forward();
            },
          ),
          Text(
            'Une psychopédagogue pour vous aider',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text('Chargement...'),
          const SizedBox(
            height: 30.0,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.teal,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[300]!),
          ),
        ],
      ),
    );
  }
}

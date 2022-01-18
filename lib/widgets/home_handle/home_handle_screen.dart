import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../config/config_route_collection.dart';
import '../../models/user.dart';
import '../create_profile.dart';

import '../../services/user_prof_d/user_profd_bloc.dart';
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
    var userReference = FirebaseFirestore.instance
        .collection(userCollection)
        .doc(FirebaseAuth.instance.currentUser?.uid);

    return StreamBuilder(
        stream: userReference.snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
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
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => MultiBlocProvider(
                            providers: [
                              BlocProvider<UserProfdBloc>(
                                  create: (context) => UserProfdBloc()
                              ),
                            ],
                            child: const CreateProfile(data: null),
                          ),
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder: (_, animation, __, child) =>
                              SlideTransition(
                                  position: Tween<Offset>(
                                      begin: const Offset(0, 1), end: Offset.zero)
                                      .animate(animation),
                                  child: child),
                        ),
                      );
                    },
                    child: const Text('Creer un profile'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.active) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            final currentUserProfD = UserProfd.fromJson(data);
            context.read<UserProfdBloc>().add(
              SetUserProfdEvent(currentUserProfD),
            );
            return BlocBuilder<UserProfdBloc, UserProfdState>(
                builder: (context, state) {
                  if (state is GetProfdState) {
                    return HomePage(user: state.user);
                  }
                  return const SizedBox.shrink();
                });
          }
          //TODO mettre un vrai loader
          return const Text("loading");
        });
  }
}

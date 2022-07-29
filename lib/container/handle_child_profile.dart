import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutx/flutx.dart';
import '../theme/app_theme.dart';
import '../config/config_route_collection.dart';
import '../services/child_profd/child_profd_bloc.dart';
import '../widgets/create_child_profile.dart';

class HandleChildProfile extends StatelessWidget {
  const HandleChildProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> childRef = FirebaseFirestore.instance
        .collection(userCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(childCollection)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: childRef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        if (snapshot.data!.docs.isEmpty) {
          return const CreateChildView();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Liste de vos enfants'),
            backgroundColor: CustomTheme().profDPrimary,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => MultiBlocProvider(
                    providers: [
                      BlocProvider<ChildProfdBloc>(
                          create: (context) => ChildProfdBloc())
                    ],
                    child: const CreateChildProfile(
                      data: null,
                      action: CreateChildProfileAction.create,
                    ),
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
            child: const Icon(Icons.add),
          ),
          body: FxContainer(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                    return ListTile(
                      title: Text(data['firstname']),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => MultiBlocProvider(
                              providers: [
                                BlocProvider<ChildProfdBloc>(
                                    create: (context) => ChildProfdBloc())
                              ],
                              child: CreateChildProfile(
                                  data: data,
                                  action: CreateChildProfileAction.update,
                                  idChild: snapshot.data!.docs[index].id),
                            ),
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            transitionsBuilder: (_, animation, __, child) =>
                                SlideTransition(
                                    position: Tween<Offset>(
                                            begin: const Offset(0, 1),
                                            end: Offset.zero)
                                        .animate(animation),
                                    child: child),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CreateChildView extends StatelessWidget {
  const CreateChildView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChildProfdBloc>(create: (context) => ChildProfdBloc())
      ],
      child: const CreateChildProfile(
        data: null,
        action: CreateChildProfileAction.create,
      ),
    );
  }
}

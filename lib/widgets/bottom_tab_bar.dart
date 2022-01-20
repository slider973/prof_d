import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../views/profile_screens.dart';
import '../services/user_prof_d/user_profd_bloc.dart';
import 'create_child_profile.dart';
import 'home_handle/home_handle_screen.dart';

class BottomTabBarController extends StatefulWidget {
  const BottomTabBarController({Key? key}) : super(key: key);

  @override
  _BottomTabBarControllerState createState() => _BottomTabBarControllerState();
}

class _BottomTabBarControllerState extends State<BottomTabBarController> {
  int tabIndex = 0;
  late List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      const HomeHandleScreen(),
      const ProfDProfileScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfdBloc>(create: (context) => UserProfdBloc())
      ],
      child: Scaffold(
          body: listScreens[tabIndex],
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[400],
              backgroundColor: Theme.of(context).primaryColor,
              currentIndex: tabIndex,
              onTap: (int index) {
                setState(() {
                  tabIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Accueil",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: "Mon profile",
                ),
              ])),
    );
  }
}

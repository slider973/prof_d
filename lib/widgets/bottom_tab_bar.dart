import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/account/screens/account_screens.dart';
import '../modules/appointement/screens/appointment_screen.dart';
import '../modules/home/screens/home_screen.dart';
import '../screens/news_screen.dart';
import '../screens/handle_chat_screen.dart';
import '../services/appointment_profd/appointment_bloc.dart';

import '../services/user_prof_d/user_profd_bloc.dart';
import '../modules/home/viewmodel/home_viewmodel.dart';

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
      const HomeScreen(),
      const AppointmentScreen(),
      const NewsScreen(),
      AccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: tabIndex,
          type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon:  Icon(Icons.home_filled) ,
                label: "Accueil",
              ),
              BottomNavigationBarItem(
                icon:   Icon(Icons.event_outlined ) ,
                activeIcon: Icon(Icons.event_rounded),
                label: "Rendez-vous",
              ),
              BottomNavigationBarItem(
                icon:   Icon(Icons.article_outlined ) ,
                activeIcon: Icon(Icons.article_rounded),
                label: "Actualité",
              ),
              BottomNavigationBarItem(
                icon:   Icon(Icons.account_circle_outlined) ,
                activeIcon: Icon(Icons.account_circle),
                label: "Compte",
              )
            ],
        ),
    );
  }
}



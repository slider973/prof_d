import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/news_screen.dart';
import '../screens/handle_chat_screen.dart';
import '../services/appointment_profd/appointment_bloc.dart';
import '../views/profile_screens.dart';
import '../services/user_prof_d/user_profd_bloc.dart';
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
      const HandleChatScreen(),
      const NewsScreen(),
      const ProfDProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfdBloc>(create: (context) => UserProfdBloc()),
        BlocProvider<AppointmentBloc>(create: (context) => AppointmentBloc(),
        )
      ],
      child: Scaffold(
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
                  icon: Icon(CupertinoIcons.chat_bubble_2) ,
                  activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill) ,
                  label: "Discussions",
                ),
                BottomNavigationBarItem(
                  icon:   Icon(Icons.article_outlined ) ,
                  activeIcon: Icon(Icons.article_rounded),
                  label: "Actualité",
                ),
                BottomNavigationBarItem(
                  icon:   Icon(Icons.settings_outlined) ,
                  activeIcon: Icon(Icons.settings),
                  label: "Réglages",
                )
              ],
          ),
      ),
    );
  }
}



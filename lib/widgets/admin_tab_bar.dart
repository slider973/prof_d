import 'package:flutter/material.dart';
import '../admin/screens/admin_appointement_screen.dart';
import '../admin/screens/dashboard_screen.dart';
import '../modules/account/screens/account_screens.dart';
import '../modules/appointement/screens/appointment_screen.dart';
import '../modules/home/screens/home_screen.dart';
import '../screens/news_screen.dart';

class AdminBottomTabBarController extends StatefulWidget {
  const AdminBottomTabBarController({Key? key}) : super(key: key);

  @override
  _AdminBottomTabBarControllerState createState() =>
      _AdminBottomTabBarControllerState();
}

class _AdminBottomTabBarControllerState
    extends State<AdminBottomTabBarController> {
  int tabIndex = 0;
  late List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [const AdminDashboardScreen(), AdminAppointmentScreen()];
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
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard_rounded),
            label: "Tableau de board",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_outlined),
            activeIcon: Icon(Icons.event_rounded),
            label: "Rendez-vous",
          )
        ],
      ),
    );
  }
}

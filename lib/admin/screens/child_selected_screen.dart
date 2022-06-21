import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'sub_screen/follow_up_screen.dart';
import 'sub_screen/appointment_screen.dart';
import 'sub_screen/information_screen.dart';
import '../components/header_component.dart';
import '../models/child.dart';

class ChildSelectedScreen extends StatefulWidget {
  final Child childSelected;

  const ChildSelectedScreen(this.childSelected, {Key? key}) : super(key: key);

  @override
  State<ChildSelectedScreen> createState() => _ChildSelectedScreenState();
}

class _ChildSelectedScreenState extends State<ChildSelectedScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    if (kDebugMode) {
      print(widget.childSelected.toString());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('dossier patient'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          HeaderComponent(
            childSelected: widget.childSelected,
          ),
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(text: 'Informations'),
              Tab(text: 'Suivie'),
              Tab(text: 'Rendez-vous'),

            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                InformationScreen(
                    childSelected: widget.childSelected
                ),
                FollowUpScreen(widget.childSelected),
                AppointmentScreen(
                  appointmentList: widget.childSelected.appointmentList,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

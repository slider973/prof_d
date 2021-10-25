import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';

class ParentView extends StatelessWidget {
  final String name;
  final List<dynamic> appointments;
  const ParentView({@required this.name, @required this.appointments})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text('hello {name}'
                    .tr
                    .replaceAll('{name}', this.name.toLowerCase())),
                Text(
                  'Display today'.tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                BlockButtonWidget(
                    color: Get.theme.accentColor,
                    text: Text(
                      'Prendre un rendez vous',
                      style: Get.textTheme.button
                          .merge(TextStyle(color: Colors.white)),
                    ),
                    icon: null,
                    onPressed: () async {
                      Get.toNamed(Routes.BOOK_APPOINTMENT);
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Rendez vous', style: Get.textTheme.headline3),
          SizedBox(
            height: 20,
          ),
          Container(
              child: ScheduleContainerWidget(
            appointments: this.appointments,
          )),
        ],
      ),
    );
  }
}

class ScheduleContainerWidget extends StatelessWidget {
  final List<dynamic> appointments;

  const ScheduleContainerWidget({@required this.appointments}) : super();

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return Text('Vous n\'avez pas de rendez vous dans les prochain jours');
    } else {
      return Text('vous avez des reservation');
    }
  }
}

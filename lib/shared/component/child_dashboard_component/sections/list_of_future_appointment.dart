import 'package:flutter/material.dart';

import '../../../../core/styles/sizes.dart';
import '../../../../services/date_parser.dart';

class ListComingAppointment extends StatelessWidget {
  final List<dynamic> appointmentList;

  const ListComingAppointment({Key? key, required this.appointmentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointmentList.length,
      itemBuilder: (context, index) {
        final data = appointmentList[index];
        final appointment = DateTime.parse(data['appointment']);
        final patient = data['patient'];

        return Padding(
          padding: const EdgeInsets.only(left: 9.0, right: 9.0, bottom: 9.0),
          child: SizedBox(
            height: 260,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildHeader(context, appointment),
                  SizedBox(
                    height: Sizes.hPaddingSmallest,
                  ),
                  _buildContentSection(context),
                  const Divider(
                    thickness: 0.1,
                    color: Colors.black,
                  ),
                  _buildChildSection(context, patient),
                  const Divider(
                    thickness: 0.1,
                    color: Colors.black,
                  ),
                  _buildElevatedButton
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ElevatedButton get _buildElevatedButton {
    return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      shape: const StadiumBorder(),
                    elevation: 0

                  ),
                  onPressed: () {},
                  child: const Text('Annulez le rendez vous',
                  style: TextStyle(
                    height: 1.0,
                    fontSize: 12
                  ),
                  ),
                );
  }

  _buildHeader(BuildContext context, DateTime day) {
    return Container(
      color: Colors.teal,
      height: 38.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 250,
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 20.0,
                ),
                SizedBox(
                  width: Sizes.hPaddingSmallest,
                ),
                Text(
                  DateParser.instance.convertDayUTCToFrLocal(day).toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.lock_clock,
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(
                width: Sizes.hPaddingSmallest,
              ),
              Text(
                DateParser.instance.convertHourUTCToFrLocal(day).toString(),
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildContentSection(BuildContext context) {
    return SizedBox(
      height: Sizes.vPaddingCustomHighest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: Sizes.hPaddingSmallest,
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).primaryColor,
            child: const Text(
              'LS',
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
          SizedBox(
            width: Sizes.hPaddingSmallest,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Lazzarotto sylvie',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Psychopedagogue'),
            ],
          )
        ],
      ),
    );
  }

  _buildChildSection(BuildContext context, patient) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: Sizes.hPaddingSmallest,
          ),
          Icon(
            Icons.account_circle,
            color: Theme.of(context).primaryColor,
            size: 36.0,
          ),
          SizedBox(
            width: Sizes.hPaddingSmallest,
          ),
          Text('${patient['firstname']} ${patient['lastname']}')
        ],
      ),
    );
  }
}

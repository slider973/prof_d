import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/styles/sizes.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../services/date_parser.dart';
import '../../../viewmodel/home_viewmodel.dart';

class ConsultingComponent extends ConsumerWidget {
  const ConsultingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeVM = ref.watch(homeViewModelViewModelProvider);
    final firstnameFirstAppointment =
        _homeVM.appointmentList.comingSoon.first.patient.firstname;
    final lastnameFirstAppointment =
        _homeVM.appointmentList.comingSoon.first.patient.lastname;
    final hours =
    DateTime.parse(_homeVM.appointmentList.comingSoon.first.appointment);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.teal, spreadRadius: 3),
        ],
      ),
      height: 250,
      child: Column(
        children: [
          Container(
            color: Colors.teal,
            height: 38.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Sizes.hPaddingSmallest,
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: Sizes.hPaddingSmallest,
                      ),
                      Text(
                        '$firstnameFirstAppointment $lastnameFirstAppointment',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Sizes.vPaddingSmall,
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_today,
                color: Colors.black54,
                size: 20.0,
              ),
              SizedBox(
                width: Sizes.hPaddingSmallest,
              ),
              CustomText.h3(
                context,
                DateParser.instance.convertDayUTCToFrLocal(hours).toString(),
              )
            ],
          ),
          SizedBox(
            height: Sizes.vPaddingSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: Colors.black54,
                size: 20.0,
              ),
              SizedBox(
                width: Sizes.hPaddingSmallest,
              ),
              CustomText.h3(
                context,
                DateParser.instance
                    .convertHourUTCToFrLocal(hours)
                    .toString(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

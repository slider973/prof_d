import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/styles/sizes.dart';
import '../../../shared/component/header_section.dart';
import '../../../shared/component/my_custom_box_decoration_with_border_radius.dart';
import '../../../shared/component/child_dashboard_component/sections/subtitle_section.dart';
import '../../../shared/component/child_dashboard_component/sections/card_time_tableList_section.dart';
import 'text_appointment_component.dart';

class HeaderWidget extends StatelessWidget {
  final List<Widget> childrenWidget;
  final String title;

  const HeaderWidget({
    required this.childrenWidget,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: Sizes.designHeightSmallest,
          child: headerSection(title, context),
          decoration: myCustomBoxDecorationWithBorderRadius(),
        ),
        subTitleSection(context, const TextAppointmentComponent()),
        ...childrenWidget
      ],
    );
  }
}



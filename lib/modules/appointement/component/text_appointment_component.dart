import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text.dart';

class TextAppointmentComponent extends StatelessWidget {
  const TextAppointmentComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
      child: CustomText.h4(
        context,
        'Sélectionnez le créneau qui vous convient ci-desous:',
        alignment: Alignment.center,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text.dart';

Container subTitleSection(BuildContext context) {
  return Container(
    color: Colors.grey[300],
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
      child: CustomText.h4(
        context,
        'Sélectionnez le créneau qui vous convient ci-desous:',
        alignment: Alignment.center,
      ),
    ),
  );
}

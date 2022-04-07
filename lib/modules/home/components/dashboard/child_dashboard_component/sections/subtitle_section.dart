import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text.dart';

Container subTitleSection(BuildContext context) {
  return Container(
    color: Colors.grey[300],
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 8.0),
      child: CustomText.h4(
        context,
        'Voici la liste de reservation selectionner une ci desous',
        alignment: Alignment.center,
      ),
    ),
  );
}

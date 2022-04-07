import 'package:flutter/material.dart';

import '../../../../../../core/styles/sizes.dart';

Container subTitleSection(BuildContext context) {
  return Container(
    color: Colors.grey[300],
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.only(left: 9.0, top: 8.0),
      child: Text(
        'Voici la liste de reservation selectionner une ci desous',
        style: TextStyle(
          fontSize: Sizes.fontSizes['h6'],
        ),
      ),
    ),
  );
}
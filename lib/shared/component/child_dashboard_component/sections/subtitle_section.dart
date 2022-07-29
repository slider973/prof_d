import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text.dart';

Container subTitleSection(BuildContext context, Widget textWidget) {
  return Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      child: textWidget);
}

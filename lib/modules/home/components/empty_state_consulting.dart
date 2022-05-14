import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/custom_text.dart';

class EmptyStateConsulting extends StatelessWidget {
  const EmptyStateConsulting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText.h3(
          context,
          'Consultation',
          alignment: Alignment.center,
          weight: FontWeight.bold,
        ),
        SvgPicture.asset(
          'assets/image/home_page_image.svg',
          height: 100,
        ),
        CustomText.h6(
          context,
          'Vous n\'avez pas de consultation pour vos enfants aujourd\'hui',
          alignment: Alignment.center,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
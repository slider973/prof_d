import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_text.dart';

StaggeredGridTile bookHistorySection(BuildContext context) {
  return StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 1.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          if (kDebugMode) {
            print('it\'s works');
          }
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText.h3(
                context,
                'Evaluation',
                alignment: Alignment.center,
                weight: FontWeight.bold,
              ),
              SvgPicture.asset(
                'assets/images/home/empty_state/undraw_personal_documents_re_vcf2.svg',
                height: 70,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
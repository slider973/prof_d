import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sections/subtitle_section.dart';
import 'sections/header_section.dart';
import '../../../../../core/viewmodels/main_core_viewmodel.dart';
import 'sections/card_time_tableList_section.dart';



class ChildDashBoardComponent extends ConsumerWidget {
  const ChildDashBoardComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentUser =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        headerSection(currentUser, context),
        subTitleSection(context),
        const CardTimeTableListSection()
      ],
    );
  }




}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/styles/sizes.dart';
import '../../../../../core/viewmodels/main_core_viewmodel.dart';
import 'card_detail_component.dart';

class CardComponent extends ConsumerWidget {
  const CardComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userModel =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();
    return Card(
      elevation: 6,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.cardRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.cardVPadding,
          horizontal: Sizes.cardHRadius,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Sizes.vMarginSmallest,
            ),
            CardUserDetailsComponent(
              user: _userModel!,
            ),
            SizedBox(
              height: Sizes.vMarginSmallest,
            ),
          ],
        ),
      ),
    );
  }
}

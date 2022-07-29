import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../viewmodel/home_viewmodel.dart';

class InvoicesSection extends ConsumerWidget {
  const InvoicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeVM = ref.watch<HomeViewModel>(homeViewModelViewModelProvider);
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 1.0, bottom: 8.0),
        child: Card(
            child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _homeVM.navigateToInvoicesListScreen(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText.h3(
                context,
                'Factures',
                alignment: Alignment.center,
                weight: FontWeight.bold,
              ),
              SvgPicture.asset(
                'assets/images/home/empty_state/invoices.svg',
                height: 70,
              )
            ],
          ),
        )),
      ),
    );
  }
}

// flutter
import 'package:flutter/material.dart';

// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../authentification/models/user_model.dart';
import '../../../../shared/component/my_custom_box_decoration.dart';
import '../../../../shared/component/my_custom_box_decoration_with_border_radius.dart';
import 'section/book_history_section.dart';
import 'section/consultation_section.dart';
import 'section/invoice_section.dart';
import 'home_text.dart';
import '../../../../core/styles/sizes.dart';
import '../../../../core/viewmodels/main_core_viewmodel.dart';
import '../../../../shared/component/header_section.dart';
import 'app_bar.dart';
import '../../../../shared/component/child_dashboard_component/sections/subtitle_section.dart';

class DashboardComponent extends ConsumerWidget {
  final UserModel currentUser;

  const DashboardComponent(this.currentUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentUser = ref.watch(mainCoreViewModelProvider).getCurrentUser();

    return Scaffold(
      appBar: buildAppBarComponent,
      body: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: Sizes.designHeightSmallest,
                  child: headerSection('Accueil', context),
                  decoration: myCustomBoxDecorationWithBorderRadius()),
              subTitleSection(context, HomeText(currentUser: currentUser)),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: Sizes.designHeightSmallest,
                  decoration: myCustomBoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: Sizes.hPaddingSmall),
                        StaggeredGrid.count(
                          crossAxisCount: 4,
                          children: [
                            const ConsultationSection(),
                            const InvoicesSection(),
                            bookHistorySection(context),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

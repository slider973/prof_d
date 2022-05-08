// flutter
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../shared/component/my_custom_box_decoration.dart';
import '../../../../shared/component/my_custom_box_decoration_with_border_radius.dart';
import 'text_accueil.dart';
import '../../../../core/styles/sizes.dart';
import '../../../../core/viewmodels/main_core_viewmodel.dart';
import '../../../../shared/component/header_section.dart';
import 'app_bar.dart';
import '../../../../shared/component/child_dashboard_component/sections/subtitle_section.dart';

class DashboardComponent extends ConsumerWidget {
  const DashboardComponent({Key? key}) : super(key: key);

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
              subTitleSection(context, TextAccueil(currentUser: currentUser)),
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
                            StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 2,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Column(
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
                                  ),
                                ),
                              )),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 1.0, bottom: 8.0),
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText.h3(
                                        context,
                                        'Mes Factures',
                                        alignment: Alignment.center,
                                        weight: FontWeight.bold,
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/home/empty_state/invoices.svg',
                                        height: 70,
                                      ),
                                      const Text('Test 1'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, top: 1.0, bottom: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (kDebugMode) {
                                      print('it\'s works');
                                    }
                                  },
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomText.h3(
                                          context,
                                          'Mon livret',
                                          alignment: Alignment.center,
                                          weight: FontWeight.bold,
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/home/empty_state/undraw_personal_documents_re_vcf2.svg',
                                          height: 70,
                                        ),
                                        CustomText.h6(
                                          context,
                                          'Pas de suivi',
                                          alignment: Alignment.center,
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
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

import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_images.dart';
import '../../../../core/styles/sizes.dart';
import 'app_bar.dart';
import 'child_dashboard_component/child_dashboard_component.dart';

class DashboardComponent extends StatelessWidget {
  const DashboardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarComponent,
      body: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: const ChildDashBoardComponent(),
      ),
    );
  }


}



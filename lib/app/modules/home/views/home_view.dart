import 'admin_view.dart';
import 'parent_view.dart';

import '../../../modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          //expandedHeight: 280,
          elevation: 0,
          iconTheme: IconThemeData(color: Get.theme.hintColor),
          title: Text(
            "Home".tr,
            style: Get.textTheme.headline6,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshHome(showMessage: true);
        },
        child: CustomScrollView(
          primary: true,
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Wrap(
                children: [ContainerIsParent(controller)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ContainerIsParent(HomeController controller) {
  if (controller.currentUser.isParent) {
    return ParentView(
      name: controller.currentUser.name,
      appointments: controller.currentUser.appointments,
    );
  } else {
    return AdminView();
  }
}

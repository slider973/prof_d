import '../widgets/speciality_grid_item_widget.dart';
import '../widgets/speciality_list_item_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controllers/specialities_controller.dart';
import '../../../widgets/home_search_bar_widget.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SpecialitiesView extends GetView<SpecialitiesController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Specialities".tr,
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => {Get.back()},
        ),
      ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshSpecialities(showMessage: true);
          },
          child: ListView(
            primary: true,
            children: [
              HomeSearchBarWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      "Specialities".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          controller.layout.value = SpecialitiesLayout.LIST;
                        },
                        icon: Obx(() {
                          return Icon(
                            Icons.format_list_bulleted,
                            color: controller.layout.value == SpecialitiesLayout.LIST ? Get.theme.accentColor : Get.theme.focusColor,
                          );
                        }),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.layout.value = SpecialitiesLayout.GRID;
                        },
                        icon: Obx(() {
                          return Icon(
                            Icons.apps,
                            color: controller.layout.value == SpecialitiesLayout.GRID ? Get.theme.accentColor : Get.theme.focusColor,
                          );
                        }),
                      )
                    ],
                  ),
                ]),
              ),
              Obx(() {
                return Offstage(
                  offstage: controller.layout.value != SpecialitiesLayout.GRID,
                  child: StaggeredGridView.countBuilder(
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: controller.specialities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SpecialityGridItemWidget(speciality: controller.specialities.elementAt(index), heroTag: "heroTag");
                    },
                    staggeredTileBuilder: (int index) => new StaggeredTile.fit(Get.mediaQuery.orientation == Orientation.portrait ? 2 : 4),
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                  ),
                );
              }),
              Obx(() {
                return Offstage(
                  offstage: controller.layout.value != SpecialitiesLayout.LIST,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.specialities.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return SpecialityListItemWidget(
                        heroTag: 'category_list',
                        expanded: index == 0,
                        speciality: controller.specialities.elementAt(index),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        )
    );
  }

}
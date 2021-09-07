import '../../clinic/widgets/clinics_nearby_you.dart';
import '../../../routes/app_pages.dart';
import '../../doctor/widgets/doctors_home_list.dart';
import '../../../modules/speciality/widgets/specialities_carousel.dart';
import '../../../widgets/emergency%20_widget.dart';
import '../../../modules/home/controllers/home_controller.dart';
import '../../../services/settings_service.dart';
import '../../../widgets/home_search_bar_widget.dart';
import '../../../widgets/notification_button_widget.dart';
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
          Get.find<SettingsService>().setting.value.appName,
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Get.theme.hintColor),
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
        actions: [NotificationsButtonWidget()],
      ),
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
                children: [
                  // HomeSearchBarWidget(),
                  // EmergencyWidget().paddingOnly(bottom: 10),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Specialities".tr,
                  //           style: Get.textTheme.bodyText2
                  //               .merge(TextStyle(fontSize: 18))),
                  //       FlatButton(
                  //         onPressed: () {
                  //           Get.toNamed(Routes.SPECIALITIES);
                  //         },
                  //         shape: StadiumBorder(),
                  //         color: Get.theme.accentColor.withOpacity(0.1),
                  //         child: Text("View All".tr,
                  //             style: Get.textTheme.subtitle1),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SpecialitiesCarouselWidget().paddingOnly(bottom: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Center(
                      child: Text("Je test quelques chose"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Top Doctors".tr,
                            style: Get.textTheme.bodyText2
                                .merge(TextStyle(fontSize: 18))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Press to see doctor details and book an appointment"
                                .tr,
                            style: Get.textTheme.bodyText1),
                      ],
                    ),
                  ),
                  DoctorsListWidget().paddingOnly(bottom: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Clinics".tr,
                            style: Get.textTheme.bodyText2
                                .merge(TextStyle(fontSize: 18))),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Enter your address to show clinics nearby you".tr,
                            style: Get.textTheme.bodyText1),
                      ],
                    ),
                  ),
                  ClinicsNearbyYou(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

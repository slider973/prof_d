import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/review_item_widget.dart';
import '../../../widgets/circular_loading_widget.dart';
import '../../../models/doctor_model.dart';
import '../widgets/doctor_title_bar_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import '../widgets/prof_d_field_widget.dart';
import '../../../../common/ui.dart';
import 'package:flutter/material.dart';
import '../controllers/doctor_controller.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DoctorView extends GetView<DoctorController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var _doctor = controller.doctor.value;
      return Scaffold(
        bottomNavigationBar: buildBlockButtonWidget(_doctor),
        body: RefreshIndicator(
            onRefresh: () async {
              controller.refreshDoctor(showMessage: true);
            },
            child: CustomScrollView(
              primary: true,
              shrinkWrap: false,
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 310,
                  elevation: 0,
                  floating: true,
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: new IconButton(
                    icon: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Get.theme.primaryColor.withOpacity(0.5),
                            blurRadius: 20,
                          ),
                      ]),
                      child: new Icon(Icons.arrow_back_ios,
                          color: Get.theme.hintColor),
                    ),
                    onPressed: () => {Get.back()},
                  ),
                  actions: [
                    new IconButton(
                      icon: Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Get.theme.primaryColor.withOpacity(0.5),
                            blurRadius: 20,
                          ),
                        ]),
                        child: (_doctor?.isFavorite ?? false)
                            ? Icon(Icons.favorite, color: Colors.redAccent)
                            : Icon(Icons.favorite_outline,
                                color: Get.theme.hintColor),
                      ),
                      onPressed: () {
                        _doctor.isFavorite
                            ? _doctor.isFavorite = true
                            : _doctor.isFavorite = false;
                      },
                    ).marginSymmetric(horizontal: 10),
                  ],
                  bottom: buildDoctorTitleBarWidget(_doctor),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Obx(() {
                      return buildHeroSlider(_doctor);
                    }),
                  ).marginOnly(bottom: 50),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      buildSpecialities(_doctor),
                      ProdDFieldWidget(
                        title: Text("Description".tr,
                            style: Get.textTheme.subtitle2),
                        content:
                            Text(_doctor.about, style: Get.textTheme.bodyText1),
                      ),
                      ProdDFieldWidget(
                        title: Text("Reviews & Ratings".tr,
                            style: Get.textTheme.subtitle2),
                        content: Column(
                          children: [
                            Text(_doctor.rate.toString(),
                                style: Get.textTheme.headline1),
                            Wrap(
                              children: Ui.getStarsList(_doctor.rate, size: 32),
                            ),
                            Text(
                              "Reviews (%s)"
                                  .trArgs([_doctor.totalReviews.toString()]),
                              style: Get.textTheme.caption,
                            ).paddingOnly(top: 10),
                            Divider(height: 35, thickness: 1.3),
                            Obx(() {
                              if (controller.reviews.isEmpty) {
                                return CircularLoadingWidget(height: 100);
                              }
                              return ListView.separated(
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  return ReviewItemWidget(
                                      review: controller.reviews.elementAt(index));
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(height: 35, thickness: 1.3);
                                },
                                itemCount: controller.reviews.length,
                                primary: false,
                                shrinkWrap: true,
                              );
                            }),
                          ],
                        ),
                        actions: [
                          // TODO view all reviews
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }

  Hero buildHeroSlider(Doctor _doctor) {
    return Hero(
      tag: controller.heroTag.value + _doctor.id,
      child: CachedNetworkImage(
        width: double.infinity,
        height: 350,
        fit: BoxFit.cover,
        imageUrl: _doctor.media.thumb,
        placeholder: (context, url) => Image.asset(
          'assets/img/loading.gif',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        errorWidget: (context, url, error) => Icon(Icons.error_outline),
      ),
    );
  }

  Widget buildBlockButtonWidget(Doctor _doctor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5)),
        ],
      ),
      child: BlockButtonWidget(
        text: Text(
          "Book an Appointment".tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline6.merge(
            TextStyle(color: Get.theme.primaryColor),
          ),
        ),
        color: Get.theme.accentColor,
        onPressed: () {
          Get.toNamed(Routes.BOOK_DOCTOR, arguments: {
            'doctor': _doctor,
          });
        },
        icon: null,
      ).paddingOnly(right: 20, left: 20),
    );
  }

  Widget buildSpecialities(Doctor _doctor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 5,
        runSpacing: 8,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Text(_doctor.speciality.name,
                style: Get.textTheme.bodyText1.merge(TextStyle(color: _doctor.speciality.color))),
            decoration: BoxDecoration(
                color: _doctor.speciality.color.withOpacity(0.2),
                border: Border.all(
                  color: _doctor.speciality.color.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ],
      ),
    );
  }

  DoctorTitleBarWidget buildDoctorTitleBarWidget(Doctor _doctor) {
    return DoctorTitleBarWidget(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _doctor.name ?? '',
                  style: Get.textTheme.headline5.merge(TextStyle(height: 1.1)),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
              if (_doctor.available == null)
                Container(
                  child: Text("  .  .  .  ".tr,
                      maxLines: 1,
                      style: Get.textTheme.bodyText2.merge(
                        TextStyle(
                            color: Colors.grey, height: 1.4, fontSize: 10),
                      ),
                      softWrap: false,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  margin: EdgeInsets.symmetric(vertical: 3),
                ),
              if (_doctor.available)
                Container(
                  child: Text("Available".tr,
                      maxLines: 1,
                      style: Get.textTheme.bodyText2.merge(
                        TextStyle(
                            color: Colors.green, height: 1.4, fontSize: 10),
                      ),
                      softWrap: false,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  margin: EdgeInsets.symmetric(vertical: 3),
                ),
              if (!_doctor.available)
                Container(
                  child: Text("Offline".tr,
                      maxLines: 1,
                      style: Get.textTheme.bodyText2.merge(
                        TextStyle(
                            color: Colors.grey, height: 1.4, fontSize: 10),
                      ),
                      softWrap: false,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  margin: EdgeInsets.symmetric(vertical: 3),
                ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: List.from(Ui.getStarsList(_doctor.rate))
                    ..addAll([
                      SizedBox(width: 5),
                      Text(
                        "Reviews (%s)"
                            .trArgs([_doctor.totalReviews.toString()]),
                        style: Get.textTheme.caption,
                      ),
                    ]),
                ),
              ),
              Ui.getPrice(
                _doctor.booking_price,
                style: Get.textTheme.headline3
                    .merge(TextStyle(color: Get.theme.accentColor)),
                unit: _doctor.booking_price != 'fixed' ? "/h".tr : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

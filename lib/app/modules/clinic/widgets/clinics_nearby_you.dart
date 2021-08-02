import 'package:cached_network_image/cached_network_image.dart';
import 'package:prof_b/app/routes/app_pages.dart';
import 'package:prof_b/common/helper.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ClinicsNearbyYou extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: Get.width,
      child: Obx((){
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 10),
          primary: false,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: controller.clinicsNearbyYou.length,
          itemBuilder: (_, index) {
            var clinic = controller.clinicsNearbyYou.elementAt(index).obs;
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.CLINIC, arguments:{'clinic': controller.clinicsNearbyYou.elementAt(index),'heroTag': 'clinics_carousel'});
              },
              child: Container(
                width: 292,
                margin: EdgeInsetsDirectional.only(end: 20, start: index == 0 ? 20 : 0),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Get.theme.primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Get.theme.focusColor.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                    border: Border.all(
                        color: Get.theme.focusColor.withOpacity(0.05))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Image of the card
                    Stack(
                      fit: StackFit.loose,
                      alignment: AlignmentDirectional.bottomStart,
                      children: <Widget>[
                        Hero(
                          tag: "clinics_carousel"+clinic.value.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: CachedNetworkImage(
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl: clinic.value.medias.first.thumb,
                              placeholder: (context, url) => Image.asset(
                                'assets/img/loading.gif',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150,
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(color: clinic.value.closed ? Colors.grey: Colors.green, borderRadius: BorderRadius.circular(24)),
                          child: clinic.value.closed
                              ? Text(
                            "Closed".tr,
                            style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor)),
                          )
                              : Text(
                            "Open".tr,
                            style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor)),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  clinic.value.name,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Get.textTheme.subtitle1,
                                ),
                                Text(
                                  clinic.value.about,
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  softWrap: false,
                                  style: Get.textTheme.caption,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      children: Ui.getStarsList(clinic.value.rate),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                          //SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {

                                  },
                                  child: Icon(Icons.directions, color: Get.theme.primaryColor),
                                  color: Get.theme.accentColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                ),
                                Text(
                                  "Rate (%s)".trArgs([clinic.value.rate.toString()]),
                                  style: Get.textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      })
    );
  }
}

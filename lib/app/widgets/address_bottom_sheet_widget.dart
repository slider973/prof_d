import 'package:prof_b/app/services/settings_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'block_button_widget.dart';
import '../services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class AddressBottomSheetWidget extends GetView {
  @override
  Widget build(BuildContext context) {
    var addressValue;
    return Container(
      height: Get.height - 500,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, -0.5)),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
              padding: EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
              children: [
                InkWell(
                  onTap:() async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlacePicker(
                            apiKey: Get.find<SettingsService>().setting.value.googleMapsKey,
                            initialPosition: Get.find<AuthService>().address.value.getLatLng(),
                            useCurrentLocation: true,
                            selectInitialPosition: true,
                            usePlaceDetailSearch: true,
                            onPlacePicked: (result) {
                              Get.find<AuthService>().address.update((val) {
                                val.address = result.formattedAddress;
                                val.latitude = result.geometry.location.lat;
                                val.longitude = result.geometry.location.lng;
                                val.userId = Get.find<AuthService>().user.value.id;
                              });
                              Get.back();
                            },
                          );
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Theme.of(context).focusColor),
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Theme.of(context).primaryColor,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Obx(() {
                                    addressValue = Get.find<AuthService>().address.value;
                                    return Text(addressValue?.address ?? "Add new address...".tr, style: Get.textTheme.bodyText2);
                                  }
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Get.theme.focusColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 1,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 25);
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.EMERGENCY);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Theme.of(context).focusColor),
                            child: Icon(
                              Icons.place,
                              color: Theme.of(context).primaryColor,
                              size: 22,
                            ),
                          ),
                          SizedBox(width: 15),
                          Flexible(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        Get.find<AuthService>().address.value.description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: Theme.of(context).textTheme.bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Theme.of(context).focusColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
            decoration: BoxDecoration(
              color: Get.theme.focusColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3),
              ),
              //child: SizedBox(height: 1,),
            ),
          ),
          Container(
            width: Get.width,
            margin: EdgeInsets.only(top: (Get.width-140), bottom: 15, left: 20, right: 20),
            child: BlockButtonWidget(
              text: Text('Continue'.tr,style: Get.textTheme.bodyText1.merge(TextStyle(color: Get.theme.primaryColor)),),
              color: Get.theme.accentColor,
              icon: null,
              onPressed: (){
                Get.toNamed(Routes.EMERGENCY);
              },
            ),
          ),
        ],
      ),
    );
  }
}

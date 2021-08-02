import 'package:cached_network_image/cached_network_image.dart';
import 'package:prof_b/app/models/doctor_model.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../../../../common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DoctorsListWidget extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: Get.width,
      child: Obx((){
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 10),
          primary: false,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: controller.topDoctors.length,
          itemBuilder: (_, index) {
            var doctor = controller.topDoctors.elementAt(index).obs;
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DOCTOR, arguments:{'doctor': controller.topDoctors.elementAt(index),'heroTag': 'doctors_carousel'});
              },
              child: Container(
                height: 150,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Container(
                            height: 140,
                            decoration: Ui.getBoxDecoration(
                              radius: 15,
                              border: Border.all(width: 5, color: Get.theme.primaryColor),
                            ),
                              child: Hero(
                                tag: 'doctors_carousel'+doctor.value.id,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  child: CachedNetworkImage(
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.cover,
                                    imageUrl: doctor.value.media.thumb,
                                    placeholder: (context, url) => Image.asset(
                                      'assets/img/loading.gif',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error_outline),
                                  ),
                                ),
                              ),
                          ),
                        SizedBox(width: 4,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.value.name,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                doctor.value.speciality.name,
                                style: Get.textTheme.bodyText1.merge(TextStyle(fontSize: 14)),
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Text(
                                    doctor.value.experience,
                                    style: Get.textTheme.bodyText1,
                                  ),
                                  SizedBox(width: 20,),
                                  Wrap(
                                    children: Ui.getStarsList(doctor.value.rate),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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

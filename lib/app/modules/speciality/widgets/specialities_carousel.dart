import 'package:cached_network_image/cached_network_image.dart';
import 'package:prof_b/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

class SpecialitiesCarouselWidget extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: Get.width,
      child: Obx(() {
        return ListView.builder(
            primary: false,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: controller.specialities.length,
            itemBuilder: (_, index) {
              var _speciality = controller.specialities.elementAt(index);
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SPECIALITY ,arguments: _speciality);
                },
                child: Container(
                  width: 130,
                  margin: EdgeInsetsDirectional.only(end: 20, start: index == 0 ? 20 : 0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Get.theme.primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Get.theme.focusColor.withOpacity(0.08),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                            ),
                      ],
                      //border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                      ),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 30,start: 10,end: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: (_speciality.image
                                  .toLowerCase()
                                  .endsWith('.svg')
                              ? SvgPicture.network(
                                    _speciality.image,
                                    color: Get.theme.hintColor.withOpacity(0.7),
                                    fit: BoxFit.fitHeight,
                                )
                              : CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: _speciality.image,
                                  placeholder: (context, url) => Image.asset(
                                    'assets/img/loading.gif',
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error_outline),
                                )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 3, top: 0),
                        child: Text(
                          _speciality.name.tr,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Get.textTheme.bodyText2.merge(TextStyle( color: Get.theme.hintColor.withOpacity(0.7),/*color : _speciality.color.withOpacity(0.5),*/)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}

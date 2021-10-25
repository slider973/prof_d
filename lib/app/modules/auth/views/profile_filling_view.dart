import 'package:prof_b/common/ui.dart';

import '../../doctor/widgets/prof_d_field_widget.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import '../../../widgets/gender_card_widget.dart';
import '../../../widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfileFillingView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.offAndToNamed(Routes.REGISTER);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: context.theme.accentColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 80,
            child: Center(
              child: Image.asset("assets/icon/icon.png"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
              child: Text(
                "Profile Filling".tr,
                style: Get.textTheme.headline6.merge(
                    TextStyle(color: context.theme.accentColor, fontSize: 22)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ProdDFieldWidget(
            title: Text("Gender".tr, style: Get.textTheme.subtitle2),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx((){
                  return GenderCardWidget(
                    avatar: Image.asset('assets/img/women.png'),
                    border: controller.checkedFeMale == true?Border.all(width: 2,color: Get.theme.accentColor.withOpacity(0.2)):null,
                    onTap: () {
                      {
                        if(controller.checkedFeMale.value){
                          controller.checkedFeMale.value=false;
                        }else{
                          controller.checkedFeMale.value=true;
                          controller.checkedMale.value=false;
                        }
                      };
                    },
                  );
                  }),
                Obx((){
                  return GenderCardWidget(
                    border: controller.checkedMale == true?Border.all(width: 2,color: Get.theme.accentColor.withOpacity(0.2)):null,
                    avatar: Image.asset('assets/img/man.png'),
                    onTap: () {
                      {
                        if(controller.checkedMale.value){
                          controller.checkedMale.value=false;
                        }else{
                          controller.checkedMale.value=true;
                          controller.checkedFeMale.value=false;
                        }
                      };
                    },
                  );
                }),


              ],
            ),
          ),
          ProdDFieldWidget(
            title: Text("Date Of Birth".tr, style: Get.textTheme.subtitle2),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx((){
                  return Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, bottom: 17),
                        child: Text('${DateFormat.yMMMd().format(controller.selectedDate.value)}')
                    ),
                  );
                }),
                MaterialButton(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    elevation: 0,
                    onPressed: () {
                      controller.showMyDatePicker(context);
                    },
                    shape: StadiumBorder(),
                    color: Get.theme.accentColor.withOpacity(0.2),
                    child: Icon(Icons.date_range_outlined,color: Get.theme.primaryColor,)
                ).paddingOnly(top: 0, bottom: 0, right: 0, left: 0),
              ],
            ),
          ),
          ProdDFieldWidget(
            title: Text("Height".tr, style: Get.textTheme.subtitle2),
            content: TextFormField(
              initialValue: "".tr,
              style: Get.textTheme.caption,
              keyboardType: TextInputType.number,

              decoration: Ui.getInputDecoration(
                hintText: "1.80 CM".tr,
                suffixIcon: Icon(
                  Icons.height,
                ),
              ),
            ),
          ),
          ProdDFieldWidget(
            title: Text("Weight".tr, style: Get.textTheme.subtitle2),
            content: TextFormField(
              initialValue: "".tr,
              style: Get.textTheme.caption,
              keyboardType: TextInputType.number,

              decoration: Ui.getInputDecoration(
                hintText: "72 KG".tr,
                suffixIcon: Icon(
                  Icons.new_releases_outlined,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: Get.width,
            child: BlockButtonWidget(
                color: Get.theme.accentColor,
                text: Text(
                  'Next',
                  style: Get.textTheme.button
                      .merge(TextStyle(color: Colors.white)),
                ),
                icon: null,
                onPressed: () {
                  Get.offAndToNamed(Routes.TABS);
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: Get.width,
            child: BlockButtonWidget(
                color: Get.theme.primaryColor,
                text: Text(
                  "Skip To Home",
                  style: Get.textTheme.button,
                ),
                icon: null,
                onPressed: () {
                  Get.offAndToNamed(Routes.TABS);
                }),
          ).paddingOnly(bottom: 30),
        ],
      ),
    );
  }
}

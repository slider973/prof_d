import '../../doctor/widgets/prof_d_field_widget.dart';
import '../../../../common/ui.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PhoneVerificationView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.offAndToNamed(Routes.ROOT);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: context.theme.accentColor,
          ),
        ),
      ),
      body: ListView(
        primary: true,
        children: [
          Container(
            height: 80,
            child: Center(
              child: Image.asset("assets/icon/icon.png"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Text(
                "Phone Verification".tr,
                style: Get.textTheme.headline6.merge(
                    TextStyle(color: context.theme.accentColor, fontSize: 22)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20,top: 50),

            child: Center(
              child: Text(
                'We sent The OTP code to your phone number, please check it and enter bellow.',
                style: Get.textTheme.bodyText1,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ProdDFieldWidget(
            title: Text('OTP Code'.tr, style: Get.textTheme.subtitle2),
            content: TextFormField(
              initialValue: "".tr,
              style: Get.textTheme.caption,
              decoration: Ui.getInputDecoration(
                hintText: "_______".tr,
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
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: Get.width,
            child: BlockButtonWidget(
                color: Get.theme.accentColor,
                text: Text(
                  'Verify',
                  style: Get.textTheme.button
                      .merge(TextStyle(color: Colors.white)),
                ),
                icon: null,
                onPressed: () {
                  Get.offAndToNamed(Routes.PROFILE_FILLING);
                }),
          ),
          SizedBox(
            height: 200,
          ),
          TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.REGISTER);
            },
            child: Text("You don't have an account?"),
          ),
          TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text("You already have an account?"),
          ).paddingOnly(bottom: 10),
        ],
      ),
    );
  }
}

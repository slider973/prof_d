import 'package:prof_b/app/modules/doctor/widgets/doctor_til_widget.dart';
import 'package:prof_b/common/ui.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../../auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<AuthController> {
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
            height: 10,
          ),
          Container(
            child: Center(
              child: Text(
                "Register".tr,
                style: Get.textTheme.headline6.merge(
                    TextStyle(color: context.theme.accentColor, fontSize: 22)),
              ),
            ),
          ),
          DoctorTilWidget(
            title: Text("Email".tr, style: Get.textTheme.subtitle2),
            content: TextFormField(
              initialValue: "Email address".tr,
              style: Get.textTheme.caption,
              decoration: Ui.getInputDecoration(
                hintText: "johndoe@gmail.com".tr,
                iconData: Icons.alternate_email,
              ),
            ),
          ),
          DoctorTilWidget(
            title: Text("Phone Number".tr, style: Get.textTheme.subtitle2),
            content: TextFormField(
              initialValue: "".tr,
              style: Get.textTheme.caption,
              keyboardType: TextInputType.number,
              decoration: Ui.getInputDecoration(
                hintText: "+1 223 665 7896".tr,
                iconData: Icons.phone_android_outlined,

              ),
            ),
          ),
          Obx(() {
            return DoctorTilWidget(
              title: Text("Password".tr, style: Get.textTheme.subtitle2),
              content: TextFormField(
                initialValue: "".tr,
                style: Get.textTheme.caption,
                decoration: Ui.getInputDecoration(
                  hintText: "••••••••••••".tr,
                  iconData: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.hidePassword.value =
                      !controller.hidePassword.value;
                    },
                    color: Theme.of(context).focusColor,
                    icon: Icon(controller.hidePassword.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            return DoctorTilWidget(
              title: Text("Confirm Password".tr, style: Get.textTheme.subtitle2),
              content: TextFormField(
                initialValue: "".tr,
                style: Get.textTheme.caption,
                decoration: Ui.getInputDecoration(
                  hintText: "••••••••••••".tr,
                  iconData: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.hidePassword.value =
                      !controller.hidePassword.value;
                    },
                    color: Theme.of(context).focusColor,
                    icon: Icon(controller.hidePassword.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                'or sign up with',
                style: Get.textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: BlockButtonWidget(
                    color: Get.theme.primaryColor,
                    text: Text(
                      'Google',
                      style: Get.textTheme.button,
                    ),
                    icon: Image.asset('assets/img/google.png'),
                    onPressed: (){
                      Get.offAndToNamed(Routes.PROFILE_FILLING);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric( horizontal: 10),
                  child: BlockButtonWidget(
                    color: Get.theme.primaryColor,
                    text: Text(
                      'Facebook',
                      style: Get.textTheme.button,
                    ),
                    icon: Image.asset('assets/img/facebook.png'),
                    onPressed: (){
                      Get.offAndToNamed(Routes.PROFILE_FILLING);
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: Get.width,
            child: BlockButtonWidget(
                color: Get.theme.accentColor,
                text: Text(
                  'Register',
                  style: Get.textTheme.button
                      .merge(TextStyle(color: Colors.white)),
                ),
                icon: null,
                onPressed: () {
                  Get.offAndToNamed(Routes.PHONE_VERIFICATION);
                }),
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

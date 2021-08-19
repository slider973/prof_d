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

class LoginView extends GetView<AuthController> {
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
                  "Login".tr,
                  style: Get.textTheme.headline6.merge(
                      TextStyle(
                      color: context.theme.accentColor, fontSize: 22)),
                ),
              ),
            ),
            DoctorTilWidget(
              title: Text("Email".tr, style: Get.textTheme.subtitle2),
              content: TextFormField(
                initialValue: "".tr,
                style: Get.textTheme.caption,
                decoration: Ui.getInputDecoration(
                  hintText: "johndoe@gmail.com".tr,
                  iconData: Icons.alternate_email,
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Center(
                child: Text(
                  'or continue using',
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: BlockButtonWidget(
                      color: Get.theme.primaryColor,
                      text: Text(
                        'Google',
                        style: Get.textTheme.button,
                      ),
                      icon: Image.asset('assets/img/google.png'),
                      onPressed: () {
                        Get.offAndToNamed(Routes.PROFILE_FILLING);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: BlockButtonWidget(
                      color: Get.theme.primaryColor,
                      text: Text(
                        'Facebook',
                        style: Get.textTheme.button,
                      ),
                      icon: Image.asset('assets/img/facebook.png'),
                      onPressed: () {
                        Get.offAndToNamed(Routes.PROFILE_FILLING);
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: Get.width,
              child: BlockButtonWidget(
                  color: Get.theme.accentColor,
                  text: Text(
                    'Log in',
                    style: Get.textTheme.button
                        .merge(TextStyle(color: Colors.white)),
                  ),
                  icon: null,
                  onPressed: () {
                    Get.offAndToNamed(Routes.TABS);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed(Routes.REGISTER);
              },
              child: Text("You don't have an account?"),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed(Routes.FORGOT_PASSWORD);
              },
              child: Text("Forgot your password ?"),
            ).paddingOnly(bottom: 10),
          ],
        ));
  }
}

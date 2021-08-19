
import '../widgets/confirm_password_field.dart';
import '../widgets/password_field.dart';

import '../widgets/email_field.dart';


import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import '../controllers/auth_controller.dart';
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
      body: buildListView(context),
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
                  'createAnAccount'.tr,
                  style: Get.textTheme.button
                      .merge(TextStyle(color: Colors.white)),
                ),
                icon: null,
                onPressed: () async {
                  await controller.register();
                  print(controller.authService.isAuth);
                  if(controller.authService.isAuth){
                    Get.offAndToNamed(Routes.TABS);
                  }
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

  ListView buildListView(BuildContext context) {
    return ListView(
      primary: true,
      children: children(context),
    );
  }

  List<Widget> children(BuildContext context) {
    return [
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

      emailField(controller),
      passwordField(context, controller),
      confirmPasswordField(context, controller)
    ];
  }







}



import 'package:prof_b/app/modules/doctor/widgets/prof_d_field_widget.dart';
import 'package:prof_b/common/ui.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends GetView{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () { Get.offAndToNamed(Routes.ROOT);},
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
          SizedBox(height: 20,),
          Container(
            child: Center(
              child: Text(
                "Forgot Password".tr,
                style: Get.textTheme.headline6.merge(TextStyle(color: context.theme.accentColor,fontSize: 22)),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Text(
                'Enter your email to send you a reset password link.',
                style: Get.textTheme.bodyText1,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ProdDFieldWidget(
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
          //SizedBox(height: 60,),

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
                  'Send Reset Link',
                  style: Get.textTheme.button.merge(TextStyle(color: Colors.white)),
                ),
                icon: null,
                onPressed: () {
                  Get.offAndToNamed(Routes.TABS);
                }),
          ),

          TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text("You remember your password?"),
          ).paddingOnly(bottom: 10),
          SizedBox(height: 100,),
        ],
      ),
    );
  }


}
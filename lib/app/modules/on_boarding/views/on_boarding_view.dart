import '../../on_boarding/controllers/on_boarding_controller.dart';
import '../../../../app/routes/app_pages.dart';
import '../../../../app/widgets/block_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Expanded(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                      child: Image.asset('assets/img/on_boarding.png')),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: Get.width,
                  child: Center(
                    child: Text(
                      "Find Your Perfect Doctor",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Get.textTheme.headline2.merge(TextStyle(
                        fontSize: 26,
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: Text(
                          "Easy way to make an appointment with a doctor",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Get.textTheme.caption.merge(TextStyle(
                            fontSize: 16,
                          )),
                      )
                  ),
                ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            width: Get.width,
            child: BlockButtonWidget(
                color: Get.theme.primaryColor,
                text: Text(
                  "Log In",
                  style: Get.textTheme.button,
                ),
                icon: null,
                onPressed: () {
                  Get.offAndToNamed(Routes.LOGIN);
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            width: Get.width,
            child: BlockButtonWidget(
                color: Get.theme.accentColor,
                text: Text(
                  'Sign In',
                  style: Get.textTheme.button.merge(TextStyle(color: Colors.white)),
                ),
                icon: null,
                onPressed: () {
                  Get.offAndToNamed(Routes.REGISTER);
                }),
          ),
          TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.TABS);
            },
            child: Text("Skip"),
          ).paddingOnly(bottom: 10),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

import '../../../widgets/block_button_widget.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: () {
                Get.offAndToNamed(Routes.PROFILE_FILLING);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
    );
  }
}
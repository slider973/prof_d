import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';
import '../../../routes/app_pages.dart';

import '../controllers/ask_confirmation_controller.dart';

class AskConfirmationViews extends GetView<AskConfirmationController> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(

     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Lottie.asset('assets/animation/green_contact/83358-contact-green.json',
             width: 200,
             height: 200,
             fit: BoxFit.fill,
           ),
           Text('Votre demande de prise de rendez-vous a été prise en compte nous revenant vers vous le plus rapidement',
           textAlign: TextAlign.center, style: Get.textTheme.headline6),
           SizedBox(height: 100),
           Center(
             child: TextButton(
               onPressed: () {
                 Navigator.pushNamed(context, Routes.TABS);
               },
               style: TextButton.styleFrom(
                   padding: EdgeInsets.all(22.0),
                   shape: StadiumBorder(),
                   backgroundColor:
                   Get.theme.accentColor.withOpacity(0.2)),
               child: Text("Retourner à l'accuille".tr,
                   style: Get.textTheme.subtitle1),
             ),
           )
         ],
       ),
     ),
   );
  }

}
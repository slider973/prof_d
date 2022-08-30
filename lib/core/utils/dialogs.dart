import 'package:get/get.dart';

import '../localization/app_localization.dart';
import '../services/navigation_service.dart';
import '../widgets/dialog_widget.dart';
import 'dialog_message_state.dart';
import '../../config/phrases.dart';

class AppDialogs {
  static Future showDefaultErrorDialog() async {
    await DialogWidget.showCustomDialog(
      context: Get.context!,
      dialogWidgetState: DialogWidgetState.error,
      title: tr('oops'),
      description: tr('somethingWentWrong') + '\n' + tr('pleaseTryAgainLater'),
      textButton: tr('OK'),
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }

  static Future showOperationCanceledDialog() async {
    await DialogWidget.showCustomDialog(
      context: Get.context!,
      dialogWidgetState: DialogWidgetState.error,
      title: tr('operationCanceledByUser'),
      textButton: tr('OK'),
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }

  static Future showEmailOrPassIncorrectDialog() async {
    DialogWidget.showCustomDialog(
      context: Get.context!,
      dialogWidgetState: DialogWidgetState.error,
      title: tr('emailOrPasswordIsInCorrect'),
      textButton: tr('OK'),
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }
  static Future featureNotReadyDialog() async {
    DialogWidget.showCustomDialog(
      context: Get.context!,
      dialogWidgetState: DialogWidgetState.warning,
      title: featureNotReady,
      textButton: tr('OK'),
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }
}

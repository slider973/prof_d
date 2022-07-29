import '../styles/app_images.dart';
import 'dialog_message_state.dart';

Map<DialogWidgetState, dynamic> dialogMessageData = {
  DialogWidgetState.error: {"icon": AppImages.error},
  DialogWidgetState.noHeader: {"icon": AppImages.noHeader},
  DialogWidgetState.info: {"icon": AppImages.info},
  DialogWidgetState.infoReversed: {"icon": AppImages.infoReverse},
  DialogWidgetState.question: {"icon": AppImages.ask},
  DialogWidgetState.success: {"icon": AppImages.success},
  DialogWidgetState.warning: {"icon": AppImages.warning},
  DialogWidgetState.confirmation: {"icon": AppImages.confirmation},
  DialogWidgetState.location: {"icon": AppImages.location},
};

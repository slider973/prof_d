import 'package:flutter/material.dart';
import '../services/init_services/connectivity_service.dart';
import '../styles/app_colors.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../utils/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading_indicators.dart';
import 'popup_page.dart';

import '../services/navigation_service.dart';

class NoInternetConnection extends StatelessWidget {
  final bool fromSplash;

  const NoInternetConnection({
    this.fromSplash = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpPage(
      onWillPop: () {
        NavigationService.offAll(
          isNamed: true,
          page: RoutePaths.coreSplash,
        );
        return Future.value(true);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingIndicators.instance.smallLoadingAnimation(context),
          SizedBox(
            height: Sizes.vMarginHigh,
          ),
          CustomText.h2(
            context,
            'Plus de connection internet',
            alignment: Alignment.center,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Sizes.vMarginSmallest,
          ),
          CustomText.h5(
            context,
            'Vous n\'avez plus de connection internet',
            alignment: Alignment.center,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Sizes.vMarginHigh,
          ),
          CustomButton(
            child: CustomText.h5(
              context,
              'Réessayer',
              color: Colors.white,
              weight: FontStyles.fontWeightMedium,
              alignment: Alignment.center,
            ),
            onPressed: () {
              ConnectivityService.instance.checkIfConnected().then((value) {
                if (value) {
                  if (fromSplash) {
                    NavigationService.offAll(
                      isNamed: true,
                      page: RoutePaths.coreSplash,
                    );
                  } else {
                    NavigationService.goBack();
                  }
                }
              });
            },
            buttonColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}

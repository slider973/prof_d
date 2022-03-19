import '../../core/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/screens/popup_page.dart';
import '../../core/styles/sizes.dart';
import '../component/app_logo_component.dart';
import '../component/auth_question_component.dart';
import '../component/login_form_component.dart';
import '../component/welcome_component.dart';
import '../viewmodels/auth_viewmodel.dart';

class LoginScreen extends ConsumerWidget {
  final AuthType? authType;

  const LoginScreen({Key? key,  this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    final authComponent = authType == AuthType.login
        ? const LoginFormComponent()
        : const LoginFormComponent();

    return PopUpPage(
      child: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.loginBackground,
              ),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenVPaddingHigh,
            horizontal: Sizes.screenHPaddingDefault,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogoComponent(),
              SizedBox(
                height: Sizes.vMarginHigh,
              ),
              const WelcomeComponent(
                subTitle: 'Connectez-vous à votre compte',
              ),
              SizedBox(
                height: Sizes.vMarginHigh,
              ),
              authComponent,
              SizedBox(
                height: Sizes.vMarginHigh,
              ),
              const AuthQuestionComponent(
                question: 'Si vous n\'avez pas de compte inscrivez vous ',
                richText: 'ici',
                isLoginQuestion: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

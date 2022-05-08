import '../../core/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/screens/popup_page.dart';
import '../../core/styles/sizes.dart';
import '../component/app_logo_component.dart';
import '../component/auth_question_component.dart';
import '../form/register_form.dart';
import '../component/welcome_component.dart';
import '../viewmodels/auth_viewmodel.dart';

class RegisterScreen extends ConsumerWidget {
  final AuthType? authType;

  const RegisterScreen({Key? key,  this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {



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
                subTitle: 'Créer votre compte',
              ),
              SizedBox(
                height: Sizes.vMarginHigh,
              ),
              const RegisterFormComponent(),
              SizedBox(
                height: Sizes.vMarginHigh,
              ),
              const AuthQuestionComponent(
                isLoginQuestion: false,
                richText: 'ici',
                question: 'Si vous avez déja un compte connectez vous ',
              )
            ],
          ),
        ),
      ),
    );
  }
}

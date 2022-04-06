import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/loading_indicators.dart';
import '../viewmodels/auth_loading_provider.dart';
import '../viewmodels/auth_viewmodel.dart';

class LoginFormComponent extends ConsumerWidget {
  const LoginFormComponent({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final authVM = ref.watch(authViewModel.notifier);

    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: authVM.emailController,
            validator: authVM.validateLoginEmail(),
            validationColor: AppColors.primaryColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            margin: EdgeInsets.only(
              bottom: Sizes.textFieldVMarginMedium,
            ),
            suffixIcon: const Icon(
              Icons.email,
              color: Color(0xff9b9b9b),
            ),
            fillColor: Colors.transparent,
            hintText: 'email',
            key: const ValueKey('email'),
          ),
          CustomTextField(
            controller: authVM.passwordController,
            validator: authVM.validateLoginPassword(),
            onFieldSubmitted: (value) {
              if (_loginFormKey.currentState!.validate()) {
                authVM.signInWithEmailAndPassword(context);
              }
            },
            validationColor: AppColors.primaryColor,
            textInputAction: TextInputAction.go,
            obscureText: true,
            margin: EdgeInsets.only(
              bottom: Sizes.textFieldVMarginMedium,
            ),
            fillColor: Colors.transparent,
            suffixIcon: const Icon(
              Icons.password,
              color: Color(0xff9b9b9b),
            ),
            hintText: 'Mot de passe',
            key: const ValueKey('password'),
          ),
          SizedBox(
            height: Sizes.vMarginSmall,
          ),
          ref.watch(authLoadingProvider)
              ? LoadingIndicators.instance.smallLoadingAnimation(
                  context,
                  width: Sizes.loadingAnimationButton,
                  height: Sizes.loadingAnimationButton,
                )
              : CustomButton(
                  text: 'se connecter',
                  buttonColor: Colors.teal,
                  splashColor: Colors.white,
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      authVM.signInWithEmailAndPassword(context);
                    }
                  },
                ),
        ],
      ),
    );
  }
}

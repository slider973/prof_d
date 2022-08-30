import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/loading_indicators.dart';
import '../viewmodels/auth_loading_provider_viewmodel.dart';
import '../viewmodels/auth_viewmodel.dart';
class RegisterFormComponent extends ConsumerStatefulWidget {
  const RegisterFormComponent({Key? key}): super(key: key);

  @override
  RegisterFormComponentState createState() =>  RegisterFormComponentState();
}
class RegisterFormComponentState extends ConsumerState<RegisterFormComponent> {



  @override
  void initState() {
    super.initState();
    // "ref" peut être utilisé dans tous les cycles de vie d'un ConsumerStatefulWidget.
    ref.read(authViewModel);
  }
  final registerFormKey = AuthViewModel.registerFormKey;
  @override
  Widget build(BuildContext context) {
    final authVM = ref.watch(authViewModel.notifier);


    return Form(
      key: registerFormKey,
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
              if (registerFormKey.currentState!.validate()) {
                authVM.signInWithEmailAndPassword(context);
              }
            },
            autoFocus: true,
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
          CustomTextField(
            controller: authVM.confirmPasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ce champ est vide';
              } else if (authVM.passwordController.text != value) {
                return 'Les 2 mot de passe doivent être identique';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              if (registerFormKey.currentState!.validate()) {
                authVM.signUpWithEmailAndPassword(context);
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
            hintText: 'Confirmation de mot de passe',
            key: const ValueKey('confirmPassword'),
          ),
          ref.watch(authLoadingProvider)
              ? LoadingIndicators.instance.smallLoadingAnimation(
                  context,
                  width: Sizes.loadingAnimationButton,
                  height: Sizes.loadingAnimationButton,
                )
              : CustomButton(
                  text: 's\'inscrire',
                  buttonColor: Colors.teal,
                  splashColor: Colors.white,
                  onPressed: () {
                    if (registerFormKey.currentState!.validate()) {
                      authVM.signUpWithEmailAndPassword(context);
                    }
                  },
                ),
        ],
      ),
    );
  }
}

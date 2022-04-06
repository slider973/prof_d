import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/navigate.dart';
import '../../core/widgets/custom_text.dart';
import '../viewmodels/auth_viewmodel.dart';

class AuthQuestionComponent extends ConsumerWidget {
  final String question;
  final String richText;
  final bool isLoginQuestion;

  const AuthQuestionComponent(
      {Key? key,
      required this.question,
      required this.richText,
      required this.isLoginQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final authVM = ref.watch(authViewModel.notifier);
    return Row(
      children: [
        CustomText.h6(
          context,
          question,
          alignment: Alignment.center,
        ),
        RichText(
          text: TextSpan(
            text: richText,
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('start change the view');
                isLoginQuestion
                    ? NavigateUtils.instance.navigationToRegisterScreen()
                    : NavigateUtils.instance.navigationToLoginScreen();
              },
          ),
        )
      ],
    );
  }
}

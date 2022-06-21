import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/create_follow_up_viewmodel.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_text_field.dart';

class CreateFollowUpForm extends ConsumerWidget {
  const CreateFollowUpForm({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _createFollowUpFormKey =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createFollowUpVM = ref.watch(createFollowUpViewModel);
    return Form(
        key: _createFollowUpFormKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 158.0, right: 158.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: createFollowUpVM.stateBefore,
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
                hintText: 'État de l\'enfant avant le suivie',
                key: const ValueKey('État de l\'enfant avant le suivie'),
              ),
              CustomTextField(
                controller: createFollowUpVM.stateAfter,
                validationColor: AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                margin: EdgeInsets.only(
                  bottom: Sizes.textFieldVMarginMedium,
                ),
                fillColor: Colors.transparent,
                hintText: 'État de l\'enfant après le suivie',
                key: const ValueKey('État de l\'enfant après le suivie'),
              ),
            ],
          ),
        ));
  }
}

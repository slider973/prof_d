import 'package:flutter/material.dart';

import '../../../../authentification/models/user_model.dart';
import '../../../../core/widgets/custom_text.dart';

class HomeText extends StatelessWidget {
  const HomeText({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final UserModel? currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: CustomText.h3(
        context,
        'Bonjour ${currentUser?.firstname}',
        alignment: Alignment.topLeft,
      ),
    );
  }
}

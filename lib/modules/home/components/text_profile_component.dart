import 'package:flutter/material.dart';

class TextProfileComponent extends StatelessWidget {
  const TextProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      'Vous n\'avez pas de profil',
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}

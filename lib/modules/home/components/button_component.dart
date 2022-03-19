import 'package:flutter/material.dart';

import '../screens/create_profile_screen.dart';

class CreateProfileButtonComponent extends StatelessWidget {
  const CreateProfileButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 17)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const CreateProfileScreen(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (_, animation, __, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero)
                        .animate(animation),
                    child: child),
          ),
        );
      },
      child: const Text('Créer un profil'),
    );
  }
}

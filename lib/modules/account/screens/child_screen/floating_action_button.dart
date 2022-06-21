import 'package:flutter/material.dart';

import '../create_child_screen.dart';

FloatingActionButton childFloatingButtonAction(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => CreateChildScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) => SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                      .animate(animation),
              child: child),
        ),
      );
    },
    child: const Icon(Icons.add),
  );
}

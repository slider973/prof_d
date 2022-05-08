import 'package:flutter/material.dart';

BoxDecoration myCustomBoxDecorationWithBorderRadius() {
  return BoxDecoration(
    color: Colors.grey[300],
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(40),
      topRight: Radius.circular(40),
    ),
  );
}
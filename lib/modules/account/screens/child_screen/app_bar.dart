import 'package:flutter/material.dart';

AppBar childAppBar(BuildContext context) {
  return AppBar(
    title: const Text('Liste de vos enfants'),
    backgroundColor: Theme.of(context).primaryColor,
  );
}
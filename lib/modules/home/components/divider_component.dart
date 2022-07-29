import 'package:flutter/material.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      thickness: 1,
      indent: 25,
      endIndent: 25,
      color: Colors.teal,
    );
  }
}

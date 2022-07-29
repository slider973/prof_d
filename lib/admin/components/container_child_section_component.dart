import 'package:flutter/material.dart';

class ContainerChildSectionComponent extends StatelessWidget {
  const ContainerChildSectionComponent({Key? key, required this.children})
      : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: children,
    );
  }
}
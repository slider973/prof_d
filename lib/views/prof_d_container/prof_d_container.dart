import 'package:flutter/material.dart';

import 'header_section.dart';

class ProfDContainer extends StatelessWidget {
  final List<Widget> childrenList;

  const ProfDContainer({Key? key, required this.childrenList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderSection(),
          _FieldSection(
            childrenList: childrenList,
          )
        ],
      ),
    );
  }
}

class _FieldSection extends StatelessWidget {
  List<Widget> childrenList = [];

  _FieldSection({Key? key, required this.childrenList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(43.0), topLeft: Radius.circular(43.0)),
        ),
        child: Column(
          children: childrenList,
        ),
      ),
    );
  }
}

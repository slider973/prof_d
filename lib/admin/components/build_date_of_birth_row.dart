import 'package:flutter/material.dart';



import '../models/child.dart';

class BuildDateOfBirthRow extends StatelessWidget {
  final List<Widget> children;
  final Child childSelected;
  
   const BuildDateOfBirthRow({
    Key? key,
    required this.childSelected, required this.children,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
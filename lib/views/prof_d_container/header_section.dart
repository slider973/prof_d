import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final double _sizeHeaderSection = !isKeyboardOpen ? 0.09.h : 0.02.h;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * _sizeHeaderSection,
      decoration: const BoxDecoration(color: Colors.teal),
    );
  }
}

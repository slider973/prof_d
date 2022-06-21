import 'package:flutter/material.dart';

import '../../core/styles/sizes.dart';

class BuildRow extends StatelessWidget {
  final List<Widget> children;

  const BuildRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.teal, spreadRadius: 3),
        ],
      ),
      width: 360,
      height: 150,
      child: Column(
        children: [
          Container(
            color: Colors.teal,
            height: 38.0,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  height: Sizes.hPaddingSmallest,
                ),
                SizedBox(
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      children[0],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children.sublist(1),
            ),
          ),
        ],
      ),
    );
  }
}

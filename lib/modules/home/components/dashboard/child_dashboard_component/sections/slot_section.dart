import 'package:flutter/material.dart';

import '../../../../../../core/utils/navigate.dart';

class SlotSection extends StatelessWidget {
  const SlotSection({
    Key? key,
    required this.slot,
  }) : super(key: key);

  final String slot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        children: [
          TextButton(
            child: Text(slot),
            onPressed: () {
              NavigateUtils.instance
                  .navigationFromTheBottomAnimation(
                  context,
                  const SizedBox.shrink());
            },
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context)
                    .primaryColor),
          ),
        ],
      ),
    );
  }
}
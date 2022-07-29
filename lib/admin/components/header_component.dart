import 'package:flutter/material.dart';

import '../models/child.dart';

class HeaderComponent extends StatelessWidget {
  final Child childSelected;

  const HeaderComponent({Key? key, required this.childSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                color: Colors.teal,
                size: 80.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                  '${childSelected.lastname.toUpperCase()} ${childSelected.firstname}'),
            ],
          )
        ],
      ),
    );
  }
}

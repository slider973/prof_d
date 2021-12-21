import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../views/prof_d_container/prof_d_container.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const marge = 38.0;

  @override
  Widget build(BuildContext context) {
    return ProfDContainer(
      childrenList: [
        SizedBox(
          height: (MediaQuery.of(context).size.height * 0.05),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.05,
              right: MediaQuery.of(context).size.height * 0.05),
          child: Row(
            children: [
              Text(
                'Inscription',
                style: TextStyle(
                    fontSize: 3.0.h,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        const FieldSection(),
      ],
    );
  }
}

class FieldSection extends StatelessWidget {
  const FieldSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: RegisterPage.marge, left: RegisterPage.marge),
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.005.h),
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Email"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.005.h),
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.005.h),
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.010.h),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              child: const Text('valider'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(52),
                  ),
                ),
              ),
              onPressed: () {
                print('Pressed');
              },
            ),
          )
        ],
      ),
    );
  }
}

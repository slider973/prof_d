import 'package:flutter/material.dart';
import 'package:prof_d/screens/auth/register_page.dart';
import '../../views/prof_d_container/prof_d_container.dart';
import 'package:sizer/sizer.dart';

import 'field_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                'Login',
                style: TextStyle(
                    fontSize: 3.0.h,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        const FieldSection(
          typeAuth: TypeAuth.login,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
            },
            child: const Text('Créer un compte'),
          ),
        )
      ],
    );
  }
}

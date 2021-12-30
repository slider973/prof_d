import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'auth_field.dart';
import 'login_page.dart';
import '../../views/prof_d_container/prof_d_container.dart';

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
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        const AuthField(
          typeAuth: TypeAuth.register,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text('Me connecter'),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/auth/auth_bloc.dart';
import 'register_page.dart';
import '../../views/prof_d_container/prof_d_container.dart';
import 'package:sizer/sizer.dart';

import 'auth_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc())],
        child: ProfDContainer(
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
                    'Se connecter',
                    style: TextStyle(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            const AuthField(
              typeAuth: TypeAuth.login,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                      ),
                  );
                },
                child: const Text('Créer un compte'),
              ),
            )
          ],
        ));
  }
}

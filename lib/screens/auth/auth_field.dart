import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/splash_screen.dart';
import '../../services/auth/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'register_page.dart';
import 'package:sizer/sizer.dart';

enum TypeAuth { login, register }

class AuthField extends StatefulWidget {
  final TypeAuth typeAuth;
  const AuthField({
    Key? key,
    required this.typeAuth,
  }) : super(key: key);

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final TextEditingController _confirmPassword = TextEditingController();
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _emailController = widget.typeAuth == TypeAuth.login
        ? TextEditingController(text: "jonathan.lemaine@hotmail.fr")
        : TextEditingController();
    _passwordController = widget.typeAuth == TypeAuth.login
        ? TextEditingController(text: "Jonathan5")
        : TextEditingController();
  }

  @override
  void dispose() {
    // Suggested to be disposed: https://flutter.dev/docs/cookbook/forms/retrieve-input#1-create-a-texteditingcontroller
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _passwordController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Ne pas être vide';
    }
    if (text.length < 4) {
      return 'Trop court';
    }
    if (_passwordController.text != _confirmPassword.text) {
      return "Le mot de passe ne correspond pas";
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final childrenList = [
      SizedBox(
        height: (MediaQuery.of(context).size.height * 0.003.h),
      ),
      TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(hintText: "Email"),
        keyboardType: TextInputType.emailAddress,
      ),
      SizedBox(
        height: (MediaQuery.of(context).size.height * 0.003.h),
      ),
      TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(hintText: "Mot de passe"),
        keyboardType: TextInputType.text,
        obscureText: true,
      ),
      SizedBox(
        height: (MediaQuery.of(context).size.height * 0.004.h),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
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
            setState(() => _submitted = true);
            if (widget.typeAuth == TypeAuth.register && _errorText == null) {
              context.read<AuthBloc>().add(
                    RegisterEvent(
                        _emailController.text, _passwordController.text),
                  );
            } else {
              context.read<AuthBloc>().add(
                    LoginEvent(_emailController.text, _passwordController.text),
                  );

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (route) => false);
            }
          },
          child: widget.typeAuth == TypeAuth.login
              ? const Text('Se connecter')
              : const Text('S\'enregistrer'),
        ),
      )
    ];
    if (widget.typeAuth == TypeAuth.register) {
      var _text = '';
      childrenList.insert(
          4,
          TextField(
            controller: _confirmPassword,
            decoration: InputDecoration(
                hintText: "Confirmation du mot de passe",
                errorText: _submitted ? _errorText : null),
            obscureText: true,
            onChanged: (text) => setState(() => _text),
          ));
      childrenList.insert(
        4,
        SizedBox(
          height: (MediaQuery.of(context).size.height * 0.002.h),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
          right: RegisterPage.marge, left: RegisterPage.marge),
      child: Column(
        children: childrenList,
      ),
    );
  }
}

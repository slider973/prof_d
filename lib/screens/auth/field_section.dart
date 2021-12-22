import 'package:flutter/material.dart';
import 'register_page.dart';
import 'package:sizer/sizer.dart';

enum TypeAuth { login, register }

class FieldSection extends StatefulWidget {
  final TypeAuth typeAuth;
  const FieldSection({
    Key? key,
    required this.typeAuth,
  }) : super(key: key);

  @override
  State<FieldSection> createState() => _FieldSectionState();
}

class _FieldSectionState extends State<FieldSection> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final childrenList = [
      SizedBox(
        height: (MediaQuery.of(context).size.height * 0.003.h),
      ),
      TextField(
        controller: _emailController,
        decoration: const InputDecoration(hintText: "Email"),
        keyboardType: TextInputType.emailAddress,
      ),
      SizedBox(
        height: (MediaQuery.of(context).size.height * 0.003.h),
      ),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(hintText: "Password"),
        keyboardType: TextInputType.text,
        obscureText: true,
      ),
      SizedBox(
        height: (MediaQuery.of(context).size.height * 0.003.h),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          child: widget.typeAuth == TypeAuth.login
              ? const Text('Se connecter')
              : const Text('s\' enregistrer'),
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
            print(_emailController.text);
            print(_passwordController.value);
          },
        ),
      )
    ];
    if (widget.typeAuth == TypeAuth.register) {
      childrenList.insert(
          3,
          const TextField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../views/prof_d_container/prof_d_container.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const marge = 38.0;

  @override
  Widget build(BuildContext context) {
    return ProfDContainer(
      childrenList: [
        const SizedBox(
          height: 57.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: marge, right: marge),
          child: Row(
            children: [
              Text(
                'Inscription',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        _fieldSection(),
      ],
    );
  }
}

class _fieldSection extends StatelessWidget {
  const _fieldSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: RegisterPage.marge, left: RegisterPage.marge),
      child: Column(
        children: [
          const SizedBox(
            height: 37.0,
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Email"),
          ),
          const SizedBox(
            height: 17.0,
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Password"),
          ),
          const SizedBox(
            height: 17.0,
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Password"),
          ),
          const SizedBox(
            height: 37.0,
          ),
           SizedBox(
             width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              child:  const Text('valider'),
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

import 'package:flutter/material.dart';

class ButtonCreateProfileFormComponent extends StatefulWidget {
  bool? isCanCalled;

   ButtonCreateProfileFormComponent({Key? key, this.isCanCalled})
      : super(key: key);

  @override
  State<ButtonCreateProfileFormComponent> createState() => _ButtonCreateProfileFormComponentState();
}

class _ButtonCreateProfileFormComponentState extends State<ButtonCreateProfileFormComponent> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        print(widget.isCanCalled);
        if (widget.isCanCalled == true) {
          print('yes');
        }
      },
      label: const Text('Créer un profil'),
      icon: const Icon(Icons.add),
    );
  }
}

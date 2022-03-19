import 'package:flutter/material.dart';
import '../modules/home/screens/home_page_todo_remove.dart';

class BuildCivitily extends StatefulWidget {
  CivilityCharacter? _character = CivilityCharacter.mr;
  final TextEditingController controller;
  BuildCivitily({Key? key, required this.controller}) : super(key: key);

  @override
  State<BuildCivitily> createState() => _BuildCivitilyState();
}

class _BuildCivitilyState extends State<BuildCivitily> {
  @override
  Widget build(BuildContext context) {
    widget._character = widget.controller.text.isNotEmpty
        ? getRadioValueFromString(widget.controller.text)
        : CivilityCharacter.mrs;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<CivilityCharacter>(
                value: CivilityCharacter.mrs,
                groupValue: widget._character,
                onChanged: (CivilityCharacter? value) {
                  setState(() {
                    widget._character = value;
                    widget.controller.text =
                        widget._character.toString().split('.').last;
                  });
                },
              ),
              const Text('Madame')
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Radio<CivilityCharacter>(
                value: CivilityCharacter.mr,
                groupValue: widget._character,
                onChanged: (CivilityCharacter? value) {
                  setState(() {
                    widget._character = value;
                    widget.controller.text =
                        widget._character.toString().split('.').last;
                  });
                },
              ),
              const Text('Monsieur'),
            ],
          ),
        ),
      ],
    );
  }
  CivilityCharacter getRadioValueFromString(String value) {
    return CivilityCharacter.values
        .where((element) => element.toString().split('.').last == value)
        .last;
  }
}

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfdDateTimeField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final DateTime selectedDate = DateTime.now();

  ProfdDateTimeField({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 50.0, top: 20.0),
      child: DateTimeField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
            labelText: labelText,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: Colors.teal,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 0.5,
              ),
            )),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null) {
            //TODO mettre le bon message d'erreur
            return "Please enter a date for your task";
          }
          return null;
        },
        controller: controller,
        format: DateFormat("dd-MM-yyyy"),
        onShowPicker: (BuildContext context, DateTime? currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    );
  }
}

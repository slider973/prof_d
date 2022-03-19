
import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

class Validators {
  Validators._();

  static final Validators instance = Validators._();

  String? Function(String?)? validateMobileNumber() {
    Pattern patternMobileNumber =
        r'^(?:[+0]9)?[0-9|٩|٠|١|٢|٣|٤|٥|٦|٧|٨]{10,15}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return 'Ce champ est vide';
      } else if (value.contains("+") &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains(RegExp(r'[a-zA-Z]')) &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        return 'Veuillez entrer un numéro valide';
      } else if (!value.contains(RegExp(r'[a-zA-Z]')) &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains("+") &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        if (checkPattern(pattern: patternMobileNumber, value: value)) {
          return 'Veuillez entrer un numéro valide';
        }
      }
    };
  }

  String? Function(String?)? validateName() {
    String patternName =
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$";
    return (value) {
      if (value!.isEmpty) {
        return 'Ce champ est vide';
      } else if (value.toString().length < 2 &&
          !checkPattern(pattern: patternName, value: value)) {
        return 'Le nom doit comporter au moins 2 lettres';
      } else if (value.toString().length > 30) {
        return 'Le nom doit comporter au maximum 30 lettres';
      } /*else if (checkPattern(pattern: patternName, value: value)) {
        return tr("pleaseEnterValidName");
      }*/
    };
  }

  String? Function(String?)? validateEmail() {
    String patternEmail = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
    return (value) {
      if (value!.isEmpty) {
        return 'Ce champ est vide';
      } else if (checkPattern(pattern: patternEmail, value: value)) {
        return 'Veuillez entrer une adresse e-mail valide';
      }
    };
  }

  String? Function(String?)? validateLoginPassword() {
    return (value) {
      if (value!.isEmpty) {
        return 'Ce champ est vide';
      }
    };
  }
  String? Function(String?)? validateConfirmLoginPassword(String field1) {
    return (value) {
      debugPrint('field1: $field1');
      if (value!.isEmpty) {
        return 'Ce champ est vide';
      } else if (field1 != value) {
        return 'Les 2 mot de passe doivent être identique';
      }
    };
  }

  bool checkPattern({pattern, value}) {
    RegExp regularCheck = RegExp(pattern);
    if (regularCheck.hasMatch(value)) {
      return false;
    }
    return true;
  }
}

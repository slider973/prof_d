import 'package:formz/formz.dart';

// Define input validation errors
enum NameInputError { empty }

class UserInput extends FormzInput<String, NameInputError> {
  // Call super.pure to represent an unmodified form input.
  const UserInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  NameInputError? validator(String value) {
    return value.isNotEmpty == true ? null : NameInputError.empty;
  }
}
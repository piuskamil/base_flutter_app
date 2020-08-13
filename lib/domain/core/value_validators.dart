import 'data_object.dart';

import 'failures.dart';

DataObject<InvalidEmail, String> validateEmailAddress(String input) {
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return DataObject.data(input);
  } else {
    return DataObject.failure(InvalidEmail());
  }
}

DataObject<InvalidPassword, String> validatePassword(String input) {
  if (input.length >= 6) {
    return DataObject.data(input);
  } else {
    return DataObject.failure(InvalidPassword());
  }
}
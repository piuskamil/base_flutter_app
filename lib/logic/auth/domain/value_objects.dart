import '../../core/domain/data_object.dart';
import '../../core/domain/failure.dart';
import '../../core/domain/value_validators.dart';

class EmailAddress {
  final DataObject<Failure, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password {
  final DataObject<Failure, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
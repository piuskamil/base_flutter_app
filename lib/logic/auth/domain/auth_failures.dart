import '../../core/domain/failure.dart';

class CancelledByUser extends Failure {}
class ServerError extends Failure {}
class EmailAlreadyInUse extends Failure {}
class InvalidEmailAndPasswordCombination extends Failure {}
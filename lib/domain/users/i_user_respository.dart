import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';

import 'user.dart';

abstract class IUsersRepository {
  Stream<DataObject<Failure, User>> getSignedInUserData();
}
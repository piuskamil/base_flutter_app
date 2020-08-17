import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';

import 'user.dart';


abstract class UsersRepositoryImp {
  Stream<DataObject<Failure, User>> getSignedInUserData();
}
import '../../core/domain/failure.dart';

import 'value_objects.dart';

import '../../core/domain/data_object.dart';
import 'package:flutter/foundation.dart';

abstract class AuthFacadeImp {
  Future<String> getSignedInUsersUid();

  Future<DataObject<Failure, void>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<DataObject<Failure, void>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<DataObject<Failure, void>> signInWithGoogle();
  Future<void> signOut();
}
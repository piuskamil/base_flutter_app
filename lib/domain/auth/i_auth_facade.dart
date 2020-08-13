import '../core/failure.dart';

import 'value_objects.dart';

import '../core/data_object.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthFacade {
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
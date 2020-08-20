import 'package:injectable/injectable.dart';

import '../../core/domain/failure.dart';
import '../domain/auth_failures.dart';
import '../domain/auth_facade.dart';
import '../domain/value_objects.dart';
import '../../core/domain/data_object.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

@LazySingleton(as: AuthFacadeImp)
class FirebaseAuthFacade implements AuthFacadeImp {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<String> getSignedInUsersUid() async {
    final User firebaseUser =  _firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    }
    return firebaseUser.uid;
  }

  @override
  Future<DataObject<Failure, void>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressStr = emailAddress.value.getOrCrash();
    final passwordStr = password.value.getOrCrash();
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailAddressStr,
            password: passwordStr,
          )
          .then((_) => DataObject.data());
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return DataObject.failure(EmailAlreadyInUse());
      } else {
        return DataObject.failure(ServerError());
      }
    }
  }

  @override
  Future<DataObject<Failure, void>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressStr = emailAddress.value.getOrCrash();
    final passwordStr = password.value.getOrCrash();
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(
            email: emailAddressStr,
            password: passwordStr,
          )
          .then((_) => DataObject.data());
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return DataObject.failure(InvalidEmailAndPasswordCombination());
      }
      return DataObject.failure(ServerError());
    }
  }

  @override
  Future<DataObject<Failure, void>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return DataObject.failure(CancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => DataObject.data());
    } on PlatformException catch (_) {
      return DataObject.failure(ServerError());
    }
  }

  @override
  Future<void> signOut() async {
    return Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }
}

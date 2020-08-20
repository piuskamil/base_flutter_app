import 'package:baseflutterapp/logic/auth/domain/auth_facade.dart';
import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';
import 'package:baseflutterapp/logic/core/domain/failures.dart';
import 'package:baseflutterapp/logic/users/domain/user_respository.dart';
import 'package:baseflutterapp/logic/users/domain/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: UsersRepositoryImp)
class UsersRepository implements UsersRepositoryImp {
  final FirebaseFirestore _firestore;
  final AuthFacadeImp _authFacade;

  UsersRepository(this._firestore, this._authFacade);

  @override
  Stream<DataObject<Failure, User>> getSignedInUserData() async* {
    final String uid = await _authFacade.getSignedInUsersUid();

    await _waitTillUserDocumentExists(uid);

    yield* _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(
          (DocumentSnapshot ds) => DataObject.data(User.fromJson(ds.data())),
        )
        .onErrorReturnWith((e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return DataObject.failure(PermissionDenied());
      } else {
        return DataObject.failure(Unexpected());
      }
    });
  }




    Future<void> _waitTillUserDocumentExists(String uid) async {
    await _firestore
        .doc('users/$uid')
        .get()
        .then((DocumentSnapshot ds) async {
      if (!ds.exists) {
        await Future.delayed(const Duration(seconds: 1));
        await _waitTillUserDocumentExists(uid);
      }
    });
  }
}

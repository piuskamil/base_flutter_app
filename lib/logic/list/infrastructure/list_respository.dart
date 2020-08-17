import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';
import 'package:baseflutterapp/logic/core/domain/failures.dart';
import 'package:baseflutterapp/logic/list/domain/list_respository.dart';
import 'package:baseflutterapp/logic/list/domain/list_element.dart';
import 'package:baseflutterapp/logic/core/infrastructure/firebase_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: ListRepositoryImp)
class ListRepository implements ListRepositoryImp {
  final Firestore _firestore;
  final FirebaseHelpers _firebaseHelpers;

  ListRepository(this._firestore, this._firebaseHelpers);

  @override
  Future<DataObject<Failure, void>> addListElement() async {
    final String uid = _firebaseHelpers.createUid();
    try {
      await _firestore
          .collection('list')
          .document(uid)
          .setData({"uid": uid}, merge: true);

      return DataObject.data();
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return DataObject.failure(PermissionDenied());
      } else {
        return DataObject.failure(Unexpected());
      }
    }
  }

  @override
  Stream<DataObject<Failure, List<ListElement>>> getListElements() async* {
    yield* _firestore
        .collection('list')
        .snapshots()
        .map((snapshot) => DataObject.data(
              snapshot.documents
                  .map((doc) =>
                      ListElement(uid: doc['uid'])) //todo ListElement.fromJson
                  .toList(),
            ))
        .onErrorReturnWith((e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return DataObject.failure(PermissionDenied());
      } else {
        return DataObject.failure(Unexpected());
      }
    });
  }

  @override
  Future<DataObject<Failure, void>> removeListElement(String uid) async {
    try {
      await _firestore.collection('list').document(uid).delete();

      return DataObject.data();
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return DataObject.failure(PermissionDenied());
      } else {
        return DataObject.failure(Unexpected());
      }
    }
  }
}

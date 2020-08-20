import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseHelpers {
  final FirebaseFirestore _firestore;

  FirebaseHelpers(this._firestore);

  String createUid() {
    return _firestore.collection('_').document().documentID;
  }
}
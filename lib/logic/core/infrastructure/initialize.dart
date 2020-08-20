import 'package:baseflutterapp/logic/core/domain/initilize.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: InitializeImp)
class InitializeFirebaseApp extends InitializeImp {
  @override
  Future<void> initialize() {
    return Firebase.initializeApp();
  }

}
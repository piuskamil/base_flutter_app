import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';

import '../domain/auth_facade.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final AuthFacadeImp _authFacade;

  AuthService(this._authFacade);

  Future<String> getSignedInUsersUid() async {
    final String uid = await _authFacade.getSignedInUsersUid();
    if (uid == null) {
      return null;
    }
    return uid;
  }

  Future<DataObject<Failure, void>> signInWithGoogle() {
    return _authFacade.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _authFacade.signOut();
  }
}

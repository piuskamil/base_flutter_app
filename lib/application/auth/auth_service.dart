import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';

import '../../domain/auth/i_auth_facade.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final IAuthFacade _authFacade;

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

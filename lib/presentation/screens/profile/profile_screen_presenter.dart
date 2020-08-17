import 'dart:async';

import 'package:baseflutterapp/logic/auth/application/auth_service.dart';
import 'package:baseflutterapp/logic/users/application/users_service.dart';
import 'package:baseflutterapp/logic/core/domain/base_presenter.dart';
import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';
import 'package:baseflutterapp/logic/users/domain/user.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileScreenView {
  void redirectToSplashScreen();

  void setUserData(DataObject<Failure, User> data);
}

@injectable
class ProfileScreenPresenter extends BasePresenter<ProfileScreenView> {
  final AuthService _authService;
  final UsersService _usersService;
  StreamSubscription _streamSubscription;

  ProfileScreenPresenter(this._authService, this._usersService);

  void init() {
    _usersService.getSignedInUserData()
        .listen((DataObject<Failure, User> data) {
      execOnView((v) {
        v.setUserData(data);
      });
    });
  }

  void dispose() {
    _streamSubscription?.cancel();
  }

  void signOut() async {
    await _authService.signOut();
    execOnView((v) {
      v.redirectToSplashScreen();
    });
  }
}

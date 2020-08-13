import 'dart:async';

import 'package:baseflutterapp/application/auth/auth_service.dart';
import 'package:baseflutterapp/application/users/users_service.dart';
import 'package:baseflutterapp/domain/core/base_presenter.dart';
import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';
import 'package:baseflutterapp/domain/users/user.dart';
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

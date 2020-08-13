import 'package:baseflutterapp/application/auth/auth_service.dart';
import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/base_presenter.dart';

abstract class LoginScreenView {
  void redirectToHomeScreen();
  void toggleLoading();
}

@injectable
class LoginScreenPresenter extends BasePresenter<LoginScreenView> {
  final AuthService _authService;

  LoginScreenPresenter(this._authService);

  void init() {}

  void signInWithGoogle() async {
    _toggleLoading();
    final DataObject<Failure, void> res = await _authService.signInWithGoogle();
    if (res.isFailure()) {
      _toggleLoading();
      // todo show UI error
    } else {
      execOnView((v) {
        v.redirectToHomeScreen();
      });
    }
  }

  void _toggleLoading() {
    execOnView((v) {
      v.toggleLoading();
    });
  }
}

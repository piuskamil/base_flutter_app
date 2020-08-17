import 'package:baseflutterapp/logic/auth/application/auth_service.dart';
import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';
import 'package:injectable/injectable.dart';

import '../../../logic/core/domain/base_presenter.dart';

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

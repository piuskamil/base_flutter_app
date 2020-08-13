import '../../../application/auth/auth_service.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/base_presenter.dart';

abstract class SplashScreenView {
  void redirectToLoginScreen();

  void redirectToHomeScreen();
}

@injectable
class SplashScreenPresenter extends BasePresenter<SplashScreenView> {
  final AuthService _authState;

  SplashScreenPresenter(this._authState);

  void init() async {
    final String uid = await this._authState.getSignedInUsersUid();
    if (uid != null) {
      execOnView((v) {
        v.redirectToHomeScreen();
      });
    } else {
      execOnView((v) {
        v.redirectToLoginScreen();
      });
    }
  }
}

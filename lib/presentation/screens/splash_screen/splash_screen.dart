import 'package:baseflutterapp/injection.dart';
import '../../core/nagivator.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'splash_screen_presenter.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with SplashScreenView {
  final SplashScreenPresenter _presenter =
      serviceLocator<SplashScreenPresenter>();

  @override
  void initState() {
    super.initState();

    _presenter.onViewReady(this);
    _presenter.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void redirectToHomeScreen() {
    AppNavigator().pushReplacement(context, HomeScreen());
  }

  @override
  void redirectToLoginScreen() {
    AppNavigator().pushReplacement(context, LoginScreen());
  }
}

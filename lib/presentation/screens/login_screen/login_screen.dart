import '../../core/nagivator.dart';
import '../home_screen/home_screen.dart';

import '../../../domain/core/const.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';
import 'login_screen_presenter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: WHITE_COLOR,
        centerTitle: true,
        title: Text('LOGIN'),
      ),
      body: _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<_LoginScreen> with LoginScreenView {
  final LoginScreenPresenter _presenter =
      serviceLocator<LoginScreenPresenter>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _presenter.onViewReady(this);
    _presenter.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator()
          : RaisedButton(
              onPressed: () {
                _presenter.signInWithGoogle();
              },
              child: Text('Sign in with google'),
            ),
    );
  }

  @override
  void redirectToHomeScreen() {
    AppNavigator().pushReplacement(context, HomeScreen());
  }

  @override
  void toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }
}

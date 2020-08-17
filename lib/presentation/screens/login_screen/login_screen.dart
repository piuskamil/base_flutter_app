import 'package:baseflutterapp/logic/lang/appliction/lang.dart';
import 'package:baseflutterapp/localizations.dart';

import '../../core/nagivator.dart';
import '../home_screen/home_screen.dart';

import '../../../logic/core/domain/const.dart';
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
  final LangModel _langModel = serviceLocator<LangModel>();
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
            : Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      _presenter.signInWithGoogle();
                    },
                    child: Text(
                        AppLocalizations.of(context).get('SIGN_WITH_GOOGLE')),
                  ),
                  FlatButton(
                    onPressed: () {
                      _langModel.langCode == LANG_PL
                          ? _langModel.changeLangTo(LANG_EN)
                          : _langModel.changeLangTo(LANG_PL);
                    },
                    child: Text(_langModel.langCode == LANG_PL ? 'PL' : 'EN'),
                  )
                ],
              ));
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

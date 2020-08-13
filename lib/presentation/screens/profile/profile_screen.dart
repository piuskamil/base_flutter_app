import 'package:baseflutterapp/domain/core/const.dart';
import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';
import 'package:baseflutterapp/domain/users/user.dart';
import 'package:baseflutterapp/presentation/core/nagivator.dart';
import 'package:baseflutterapp/presentation/screens/profile/profile_screen_presenter.dart';
import 'package:baseflutterapp/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: WHITE_COLOR,
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<_ProfileScreen> with ProfileScreenView {
  final ProfileScreenPresenter _presenter =
      serviceLocator<ProfileScreenPresenter>();
  DataObject<Failure, User> userData;

  @override
  void initState() {
    super.initState();

    _presenter.onViewReady(this);
    _presenter.init();
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          userData == null
              ? CircularProgressIndicator()
              : userData.isFailure()
                  ? Text('Error during fetching user data')
                  : Column(
                      children: [
                        Text(userData.data.displayName),
                        Text(userData.data.email),
                      ],
                    ),
          Divider(),
          RaisedButton(
            onPressed: () {
              _presenter.signOut();
            },
            child: Text('SignOut'),
          )
        ],
      ),
    );
  }

  @override
  void redirectToSplashScreen() {
    AppNavigator()
        .pushReplacement(context, SplashScreen(), rootNavigator: true);
  }

  @override
  void setUserData(DataObject<Failure, User> data) {
    setState(() {
      userData = data;
    });
  }
}

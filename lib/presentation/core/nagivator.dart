import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigator {
  push(BuildContext context, Widget screen, {bool rootNavigator = false}) {
    Navigator.of(context, rootNavigator: rootNavigator)
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  pushReplacement(BuildContext context, Widget screen,
      {bool rootNavigator = false}) {
    Navigator.of(context, rootNavigator: rootNavigator)
        .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }
}

import 'package:baseflutterapp/presentation/screens/list/list_screen.dart';
import 'package:baseflutterapp/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context, {
    int materialIndex: 500,
  }) {
    return {
      TabNavigatorRoutes.root: (context) {
        if (tabItem == TabItem.home) {
          return ListScreen();
        } else if (tabItem == TabItem.profile) {
          return ProfileScreen();
        } else {
          return ListScreen();
        }
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
          settings: RouteSettings(name: routeSettings.name),
        );
      },
    );
  }
}

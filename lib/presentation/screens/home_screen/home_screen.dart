import 'package:baseflutterapp/presentation/screens/home_screen/tab_navigator.dart';

import '../../../logic/core/domain/const.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';
import 'bottom_navigation_bar.dart';
import 'home_screen_presenter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<_HomeScreen> with HomeScreenView {
  final HomeScreenPresenter _presenter = serviceLocator<HomeScreenPresenter>();
  TabItem _currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.profile: GlobalKey<NavigatorState>(),
    TabItem.home: GlobalKey<NavigatorState>(),
  };

  @override
  void initState() {
    super.initState();

    _presenter.onViewReady(this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      if (_currentTab == TabItem.home) {
        return;
      }

      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.profile),
          _buildOffstageNavigator(TabItem.home),
        ]),
        bottomNavigationBar: BottomMenu(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {

    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

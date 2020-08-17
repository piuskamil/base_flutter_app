import 'dart:async';

import 'package:baseflutterapp/logic/core/domain/const.dart';
import 'package:flutter/material.dart';

enum TabItem { profile, home }

class BottomMenu extends StatefulWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  BottomMenu({this.currentTab, this.onSelectTab});

  @override
  State<StatefulWidget> createState() {
    return BottomMenuState(
      onSelectTab: onSelectTab,
    );
  }
}

class BottomMenuState extends State<BottomMenu> {
  final ValueChanged<TabItem> onSelectTab;
  StreamSubscription _userDataAccountSubscription;
  int menuElements = 2;

  BottomMenuState({this.onSelectTab});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    _userDataAccountSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildElement({
      bool active,
      Widget icon,
      Function onTap,
      int badge,
      bool actionAvailable,
    }) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / menuElements,
                child: icon,
              ),
              badge != null && badge > 0
                  ? Positioned(
                      top: 5,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: ERROR_COLOR_STRONG,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '$badge',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: WHITE_COLOR,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    )
                  : Container(),
              actionAvailable == true
                  ? Positioned(
                      top: 5,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: BOTTOM_NAV_COLOR, width: 0)),
        color: BOTTOM_NAV_COLOR,
      ),
      child: SafeArea(
        left: false,
        right: false,
        child: Container(
          decoration: const BoxDecoration(
            color: BOTTOM_NAV_COLOR,
          ),
          height: BOTTOM_NAV_HEIGHT,
          child: Row(
            children: <Widget>[
              _buildElement(
                active: widget.currentTab == TabItem.home,
                icon: Icon(Icons.home, color: widget.currentTab == TabItem.home ? WHITE_COLOR : BLACK_COLOR,),
                onTap: () {
                  onSelectTab(TabItem.home);
                },
              ),
              _buildElement(
                active: widget.currentTab == TabItem.profile,
                icon: Icon(Icons.person, color: widget.currentTab == TabItem.profile ? WHITE_COLOR : BLACK_COLOR,),
                onTap: () {
                  onSelectTab(TabItem.profile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

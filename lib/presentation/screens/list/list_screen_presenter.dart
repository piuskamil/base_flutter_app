import 'dart:async';

import 'package:baseflutterapp/application/list/list_service.dart';
import 'package:baseflutterapp/domain/core/base_presenter.dart';
import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';
import 'package:baseflutterapp/domain/list/list_element.dart';
import 'package:injectable/injectable.dart';

abstract class ListScreenView {
  void setList(DataObject<Failure, List<ListElement>> data);
}

@injectable
class ListScreenPresenter extends BasePresenter<ListScreenView> {
  final ListService _listService;
  StreamSubscription _streamSubscription;

  ListScreenPresenter(this._listService);

  void init() {
    _streamSubscription = _listService
        .getListElements()
        .listen((DataObject<Failure, List<ListElement>> data) {
      execOnView((v) {
        v.setList(data);
      });
    });
  }

  void add() async {
    DataObject<Failure, void> res = await _listService.addListElement();
    if (res.isFailure()) {
      print('::::::::::::::::::::: ERROR');
    }
  }
  void remove(String uid) async {
    DataObject<Failure, void> res = await _listService.removeListElement(uid);
    if (res.isFailure()) {
      print('::::::::::::::::::::: ERROR');
    }
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}

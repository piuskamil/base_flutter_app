import 'package:baseflutterapp/domain/core/const.dart';
import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';
import 'package:baseflutterapp/domain/list/list_element.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';
import 'list_screen_presenter.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ListScreen();
  }
}

class _ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<_ListScreen> with ListScreenView {
  final ListScreenPresenter _presenter = serviceLocator<ListScreenPresenter>();
  DataObject<Failure, List<ListElement>> dataList;

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

    return Scaffold(
        backgroundColor: WHITE_COLOR,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: WHITE_COLOR,
          centerTitle: true,
          title: Text('List'),
          actions: [
            IconButton(
              onPressed: () {
                _presenter.add();
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: dataList == null ? CircularProgressIndicator() : dataList.isFailure()
            ? Text('Error during fetching list')
            : ListView.builder(
          itemCount: dataList.data.length,
          itemBuilder: (context, idx) {
            final ListElement _listElement = dataList.data[idx];
            return ListTile(
              title: Text(_listElement.uid, style: Theme.of(context).textTheme.headline1.copyWith(color: BLACK_COLOR),),
              trailing: IconButton(
                onPressed: () {
                  _presenter.remove(_listElement.uid);
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        )
    );
  }

  @override
  void setList(DataObject<Failure, List<ListElement>> data) {
    setState(() {
      dataList = data;
    });
  }
}

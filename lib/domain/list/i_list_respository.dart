import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';

import 'list_element.dart';


abstract class IListRepository {
  Stream<DataObject<Failure, List<ListElement>>> getListElements();

  Future<DataObject<Failure, void>> addListElement();

  Future<DataObject<Failure, void>> removeListElement(String uid);
}
import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';

import 'list_element.dart';


abstract class ListRepositoryImp {
  Stream<DataObject<Failure, List<ListElement>>> getListElements();

  Future<DataObject<Failure, void>> addListElement();

  Future<DataObject<Failure, void>> removeListElement(String uid);
}
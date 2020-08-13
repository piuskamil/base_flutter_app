import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';
import 'package:baseflutterapp/domain/list/i_list_respository.dart';
import 'package:baseflutterapp/domain/list/list_element.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ListService {
  final IListRepository _listRepository;

  ListService(this._listRepository);

  Stream<DataObject<Failure, List<ListElement>>> getListElements() {
    return _listRepository.getListElements();
  }

  Future<DataObject<Failure, void>> addListElement() {
    return _listRepository.addListElement();
  }

  Future<DataObject<Failure, void>> removeListElement(String uid) {
    return _listRepository.removeListElement(uid);
  }
}

import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';
import 'package:baseflutterapp/logic/list/domain/list_respository.dart';
import 'package:baseflutterapp/logic/list/domain/list_element.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ListService {
  final ListRepositoryImp _listRepository;

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

import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/core/domain/failure.dart';
import 'package:baseflutterapp/logic/users/domain/user_respository.dart';
import 'package:baseflutterapp/logic/users/domain/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UsersService {
  final UsersRepositoryImp _usersRepository;

  UsersService(this._usersRepository);

  Stream<DataObject<Failure, User>> getSignedInUserData() {
    return this._usersRepository.getSignedInUserData();
  }

}
import 'package:baseflutterapp/domain/core/data_object.dart';
import 'package:baseflutterapp/domain/core/failure.dart';
import 'package:baseflutterapp/domain/users/i_user_respository.dart';
import 'package:baseflutterapp/domain/users/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UsersService {
  final IUsersRepository _usersRepository;

  UsersService(this._usersRepository);

  Stream<DataObject<Failure, User>> getSignedInUserData() {
    return this._usersRepository.getSignedInUserData();
  }

}
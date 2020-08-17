import 'package:baseflutterapp/logic/users/domain/user.dart';

abstract class LoggerFacadeImp {
  void log(dynamic exception, [dynamic stackTrace]) {}

  void setUserContext(User user) {}
}
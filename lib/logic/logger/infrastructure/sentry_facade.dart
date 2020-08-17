import 'package:baseflutterapp/logic/logger/domain/logger_facade.dart';
import 'package:baseflutterapp/logic/users/domain/user.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sentry/sentry.dart' as SENTRY;

@dev
@LazySingleton(as: LoggerFacadeImp)
class SentryFacadeDev implements LoggerFacadeImp {
  @override
  void log(dynamic exception, [dynamic stackTrace]) {
    Logger().e(exception, null, stackTrace);
  }

  @override
  void setUserContext(User user) {
  }
}

@prod
@LazySingleton(as: LoggerFacadeImp)
class SentryFacadeProd implements LoggerFacadeImp {
  final SENTRY.SentryClient _sentry = SENTRY.SentryClient(
    dsn: 'https://dab49114062a4310bf329155e853f5fe@sentry.io/5005815',
    environmentAttributes: SENTRY.Event(
      environment: 'production',
    ),
  );

  @override
  void log(dynamic exception, [dynamic stackTrace]) {
    _sentry.captureException(
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  @override
  void setUserContext(User user) {
    _sentry.userContext = SENTRY.User(
      id: user.uid,
      email: user.email,
      username: user.displayName,
    );
  }
}

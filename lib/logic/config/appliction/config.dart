import 'package:injectable/injectable.dart';

abstract class AppConfig {
  final bool production = false;
  final String apiUrl = null;
}

@dev
@LazySingleton(as: AppConfig)
class DevAppConfig extends AppConfig {


}

@prod
@LazySingleton(as: AppConfig)
class ProdAppConfig extends AppConfig {
  final bool production = true;
}

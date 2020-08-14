import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt serviceLocator = GetIt.instance;

@InjectableInit()
void configureDependencies(String env) => $initGetIt(serviceLocator, environment: env);
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'logic/config/appliction/config.dart';
import 'logic/auth/domain/auth_facade.dart';
import 'logic/auth/application/auth_service.dart';
import 'logic/auth/infrastructure/firebase_auth_facade.dart';
import 'logic/core/infrastructure/firebase_helpers.dart';
import 'logic/core/infrastructure/firebase_injectable_module.dart';
import 'presentation/screens/home_screen/home_screen_presenter.dart';
import 'logic/lang/appliction/lang.dart';
import 'logic/list/infrastructure/list_respository.dart';
import 'logic/list/domain/list_respository.dart';
import 'presentation/screens/list/list_screen_presenter.dart';
import 'logic/list/application/list_service.dart';
import 'logic/logger/domain/logger_facade.dart';
import 'presentation/screens/login_screen/login_screen_presenter.dart';
import 'presentation/screens/profile/profile_screen_presenter.dart';
import 'logic/logger/infrastructure/sentry_facade.dart';
import 'presentation/screens/splash_screen/splash_screen_presenter.dart';
import 'logic/users/infrastructure/users_respository.dart';
import 'logic/users/domain/user_respository.dart';
import 'logic/users/application/users_service.dart';

/// Environment names
const _dev = 'dev';
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<AppConfig>(() => DevAppConfig(), registerFor: {_dev});
  gh.lazySingleton<AppConfig>(() => ProdAppConfig(), registerFor: {_prod});
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<FirebaseHelpers>(
      () => FirebaseHelpers(get<FirebaseFirestore>()));
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.factory<HomeScreenPresenter>(() => HomeScreenPresenter());
  gh.lazySingleton<LangModel>(() => LangModel());
  gh.lazySingleton<ListRepositoryImp>(
      () => ListRepository(get<FirebaseFirestore>(), get<FirebaseHelpers>()));
  gh.lazySingleton<ListService>(() => ListService(get<ListRepositoryImp>()));
  gh.lazySingleton<LoggerFacadeImp>(() => SentryFacadeDev(),
      registerFor: {_dev});
  gh.lazySingleton<LoggerFacadeImp>(() => SentryFacadeProd(),
      registerFor: {_prod});
  gh.lazySingleton<AuthFacadeImp>(
      () => FirebaseAuthFacade(get<FirebaseAuth>(), get<GoogleSignIn>()));
  gh.lazySingleton<AuthService>(() => AuthService(get<AuthFacadeImp>()));
  gh.factory<ListScreenPresenter>(
      () => ListScreenPresenter(get<ListService>()));
  gh.factory<LoginScreenPresenter>(
      () => LoginScreenPresenter(get<AuthService>()));
  gh.factory<SplashScreenPresenter>(
      () => SplashScreenPresenter(get<AuthService>()));
  gh.lazySingleton<UsersRepositoryImp>(
      () => UsersRepository(get<FirebaseFirestore>(), get<AuthFacadeImp>()));
  gh.lazySingleton<UsersService>(() => UsersService(get<UsersRepositoryImp>()));
  gh.factory<ProfileScreenPresenter>(
      () => ProfileScreenPresenter(get<AuthService>(), get<UsersService>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

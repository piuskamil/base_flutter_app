// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'application/auth/auth_service.dart';
import 'infrastructure/auth/firebase_auth_facade.dart';
import 'infrastructure/core/firebase_helpers.dart';
import 'infrastructure/core/firebase_injectable_module.dart';
import 'presentation/screens/home_screen/home_screen_presenter.dart';
import 'domain/auth/i_auth_facade.dart';
import 'domain/list/i_list_respository.dart';
import 'domain/users/i_user_respository.dart';
import 'infrastructure/list/list_respository.dart';
import 'presentation/screens/list/list_screen_presenter.dart';
import 'application/list/list_service.dart';
import 'presentation/screens/login_screen/login_screen_presenter.dart';
import 'presentation/screens/profile/profile_screen_presenter.dart';
import 'presentation/screens/splash_screen/splash_screen_presenter.dart';
import 'infrastructure/users/users_respository.dart';
import 'application/users/users_service.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<Firestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.factory<HomeScreenPresenter>(() => HomeScreenPresenter());
  gh.lazySingleton<IAuthFacade>(
      () => FirebaseAuthFacade(get<FirebaseAuth>(), get<GoogleSignIn>()));
  gh.lazySingleton<IUsersRepository>(
      () => UsersRepository(get<Firestore>(), get<IAuthFacade>()));
  gh.lazySingleton<UsersService>(() => UsersService(get<IUsersRepository>()));
  gh.lazySingleton<AuthService>(() => AuthService(get<IAuthFacade>()));
  gh.lazySingleton<FirebaseHelpers>(() => FirebaseHelpers(get<Firestore>()));
  gh.lazySingleton<IListRepository>(
      () => ListRepository(get<Firestore>(), get<FirebaseHelpers>()));
  gh.lazySingleton<ListService>(() => ListService(get<IListRepository>()));
  gh.factory<LoginScreenPresenter>(
      () => LoginScreenPresenter(get<AuthService>()));
  gh.factory<ProfileScreenPresenter>(
      () => ProfileScreenPresenter(get<AuthService>(), get<UsersService>()));
  gh.factory<SplashScreenPresenter>(
      () => SplashScreenPresenter(get<AuthService>()));
  gh.factory<ListScreenPresenter>(
      () => ListScreenPresenter(get<ListService>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

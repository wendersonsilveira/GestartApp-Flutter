import 'package:Gestart/data/datasource/auth/auth_local_data_source.dart';
import 'package:Gestart/data/datasource/user/user_remote_data_source.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/remote/interceptors/auth_interceptor.dart';
import 'package:Gestart/data/repositories/user/user_repository_impl.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/usecases/auth/check_user_use_case.dart';
import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/data/repositories/auth/auth_repository_impl.dart';
import 'package:Gestart/data/datasource/auth/auth_remote_data_source.dart';
import 'package:Gestart/domain/usecases/auth/login_use_case.dart';
import 'package:Gestart/domain/usecases/user/create_user_use_case.dart';
import 'package:Gestart/domain/usecases/user/update_password_use_case.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

Future<GetIt> initGetIt(GetIt get) async {
  WidgetsFlutterBinding.ensureInitialized();
  final gh = GetItHelper(get);
  final dio = Dio();

  // Auth
  gh.factory<AuthInterceptor>(() => AuthInterceptor(get<Dio>()));
  gh.factory<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(get<CustomDio>()));
  gh.factory<AuthLocalDataSource>(
      () => AuthLocalDataSource(get<SharedPreferencesManager>()));
  gh.factory<CheckUserUseCase>(() => CheckUserUseCase(get<AuthRepository>()));
  gh.factory<LoginUseCase>(() => LoginUseCase(get<AuthRepository>()));

  // User
  gh.factory<UserRemoteDataSource>(
      () => UserRemoteDataSource(get<CustomDio>()));
  gh.factory<CreateUserUseCase>(() => CreateUserUseCase(get<UserRepository>()));
  gh.factory<UpdatePasswordUseCase>(
      () => UpdatePasswordUseCase(get<UserRepository>()));

  //  Singleton
  gh.singleton<Dio>(dio);
  gh.singleton<SharedPreferencesManager>(SharedPreferencesManager());

  gh.singleton<CustomDio>(CustomDio(get<Dio>(), get<AuthInterceptor>()));

  gh.singleton<AuthRepository>(AuthRepositoryImpl(
      get<AuthRemoteDataSource>(), get<AuthLocalDataSource>()));
  gh.singleton<UserRepository>(UserRepositoryImpl(get<UserRemoteDataSource>()));

  return get;
}

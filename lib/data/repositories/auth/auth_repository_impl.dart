import 'package:Gestart/data/datasource/auth/auth_local_data_source.dart';
import 'package:Gestart/data/datasource/auth/auth_remote_data_source.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource;
  AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<ResourceData<int>> checkUser(cpfCnpj) async {
    final resource = await _authRemoteDataSource.checkUser(cpfCnpj);

    return resource;
  }

  @override
  Future<ResourceData<UserEntity>> login(LoginAuthEntity entity) async {
    final resource = await _authRemoteDataSource.login(entity);

    if (resource.status == Status.success)
      _authLocalDataSource.saveToken(resource.data.token);

    return resource;
  }
}

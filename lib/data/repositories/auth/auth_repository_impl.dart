import 'package:Gestart/data/datasource/auth/auth_remote_data_source.dart';
import 'package:Gestart/domain/repositories/auth/auth_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<ResourceData<int>> checkUser(cpfCnpj) async {
    final resource = await _authRemoteDataSource.checkUser(cpfCnpj);

    return resource;
  }
}

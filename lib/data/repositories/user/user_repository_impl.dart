import 'package:Gestart/data/datasource/user/user_remote_data_source.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/entities/user/password_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/repositories/user/user_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<ResourceData> createUser(CreateUserEntity user) async {
    final resource = await _userRemoteDataSource.createUser(user);

    return resource;
  }

  @override
  Future<ResourceData> updatePassword(UpdatePasswordEntity id) async {
    final resource = await _userRemoteDataSource.esqueciMinhaSenha(id);

    return resource;
  }

  @override
  Future<ResourceData<UserEntity>> getPerfil() async {
    final resource = await _userRemoteDataSource.getPerfil();

    return resource;
  }

  @override
  Future<ResourceData<bool>> alterarSenha(PasswordEntity pass) async {
    final resource = await _userRemoteDataSource.alterarSenha(pass);

    return resource;
  }

  @override
  Future<ResourceData<bool>> checarSenha(String entity) async {
    final resource = await _userRemoteDataSource.checarSenha(entity);

    return resource;
  }

  @override
  Future<ResourceData<bool>> alterarConta(CreateUserEntity entity) async {
    final resource = await _userRemoteDataSource.alterarPerfil(entity);

    return resource;
  }

  @override
  Future<ResourceData<int>> excluirConta() async {
    final resource = await _userRemoteDataSource.excluirConta();

    return resource;
  }
}

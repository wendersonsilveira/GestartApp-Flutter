import 'package:Gestart/data/datasource/user/user_remote_data_source.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
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
    final resource = await _userRemoteDataSource.updatePassord(id);

    return resource;
  }
}

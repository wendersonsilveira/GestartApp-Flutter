import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class UserRepository {
  Future<ResourceData> createUser(CreateUserEntity user);
  Future<ResourceData> updatePassword(UpdatePasswordEntity id);
}

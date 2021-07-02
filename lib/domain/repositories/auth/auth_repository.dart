import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class AuthRepository {
  Future<ResourceData<int>> checkUser(cpfCnpj);
  Future<ResourceData<UserEntity>> login(LoginAuthEntity entity);
}

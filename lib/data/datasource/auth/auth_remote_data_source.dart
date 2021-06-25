import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/data/mappers/auth/login_mapper.dart';
import 'package:Gestart/data/mappers/user/user_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDataSource {
  CustomDio _dio;
  AuthRemoteDataSource(this._dio);

  Future<ResourceData<int>> checkUser(IdUserEntity user) async {
    try {
      final result =
          await _dio.post('login-check', data: {"USUARIO": user.cpfCnpj});

      return ResourceData<int>(status: Status.success, data: result['status']);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar usuario",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<UserEntity>> login(LoginAuthEntity entity) async {
    try {
      final result = await _dio.post('login', data: entity.toMap());

      return ResourceData<UserEntity>(
          status: Status.success, data: UserEntity().fromMap(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar usuario",
          error: ErrorMapper.from(e));
    }
  }
}

import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_return_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:Gestart/data/mappers/user/create_user_mapper.dart';
import 'package:Gestart/data/mappers/user/update_password_return_mapper.dart';

import 'package:Gestart/data/mappers/user/update_password_mapper.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserRemoteDataSource {
  CustomDio _dio;
  UserRemoteDataSource(this._dio);

  Future<ResourceData> createUser(CreateUserEntity entity) async {
    try {
      final result = await _dio.post('createAccount', data: entity.toMap());

      if (result[0]['status'] == -1)
        return ResourceData(
          status: Status.failed,
          data: null,
          message: result[0]['ERRO'],
        );
      else
        return ResourceData(status: Status.success, message: 'Foi');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao criar o usuario",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<UpdatePasswordReturnEntity>> updatePassord(
      UpdatePasswordEntity entity) async {
    try {
      final result = await _dio.post('recuperar-senha', data: entity.toMap());

      if (result['status'] == -1)
        return ResourceData(
          status: Status.failed,
          data: null,
          message: result[0]['ERRO'],
        );
      else
        return ResourceData(
            status: Status.success,
            data: UpdatePasswordReturnEntity().fromMap(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao criar o usuario",
          error: ErrorMapper.from(e));
    }
  }
}

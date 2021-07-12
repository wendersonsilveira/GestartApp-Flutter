import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/entities/user/password_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_return_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/data/mappers/user/user_mapper.dart';
import 'package:Gestart/data/mappers/user/password_mapper.dart';
import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';
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

  Future<ResourceData<UserEntity>> getPerfil() async {
    try {
      final result = await _dio.get('perfil');

      if (result.length > 0)
        return ResourceData<UserEntity>(
            status: Status.success, data: UserEntity().fromMap(result[0]));
      else
        return ResourceData<UserEntity>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar o usuario",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<bool>> alterarSenha(PasswordEntity pass) async {
    try {
      final result = await _dio.post('alterar-senha/', data: pass.toMap());

      if (result[0]['status'] != null) print(result[0]['status']);
      if (result[0]['status'] == null)
        return ResourceData<bool>(
            status: Status.success,
            data: true,
            message: 'Senha alterada com sucesso!');
      else
        return ResourceData<bool>(
            status: Status.success, data: false, message: result[0]['status']);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao alterar a senha",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<bool>> checarSenha(String pass) async {
    try {
      final result = await _dio.post('validaSenha/', data: {"SENHA": pass});

      return ResourceData<bool>(
          status: Status.success, data: result['success']);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao alterar a senha",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<bool>> alterarPerfil(CreateUserEntity user) async {
    try {
      final result = await _dio.post('updateAccount', data: user.toMap());

      return ResourceData<bool>(status: Status.success, data: result);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao alterar a senha",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<int>> excluirConta() async {
    try {
      final result = await _dio.delete('excluir-conta');

      return ResourceData<int>(status: Status.success, data: result['success']);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao excluir a conta",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<UpdatePasswordReturnEntity>> esqueciMinhaSenha(
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

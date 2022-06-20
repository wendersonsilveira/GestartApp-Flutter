import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/entities/condominio/emails_ativacao_entity.dart';
import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/data/mappers/condominio/condominio_mapper.dart';
import 'package:Gestart/data/mappers/user_adm/user_adm_mapper.dart';
import 'package:Gestart/data/mappers/condominio/condominio_ativo_mapper.dart';
import 'package:Gestart/data/mappers/condominio/condominios_ativos_mapper.dart';
import 'package:Gestart/data/mappers/condominio/emails_ativacao_mapper.dart';
import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/data/mappers/auth/login_mapper.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CondominioRemoteDataSource {
  CustomDio _dio;
  CondominioRemoteDataSource(this._dio);

  Future<ResourceData<List<CondominioEntity>>> getCondominioPorCpf() async {
    try {
      final result = await _dio.get('condominios_por_cpfcnpj');
      if (result.length > 0)
        return ResourceData<List<CondominioEntity>>(
            status: Status.success,
            data: CondominioEntity().fromMapList(result));
      else
        return ResourceData<List<CondominioEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar os condominios",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<UnidadeAtivaEntity>>> condominioAtivo() async {
    try {
      final result = await _dio.get('condominiosAtivos');

      if (result.length > 0)
        return ResourceData<List<UnidadeAtivaEntity>>(
            status: Status.success,
            data: UnidadeAtivaEntity().fromMapList(result));
      else
        return ResourceData<List<UnidadeAtivaEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar os condominios ativos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<CondominiosAtivosEntity>>>
      condominiosAtivos() async {
    try {
      final result = await _dio.get('condominiosAtivosV2');

      if (result.length > 0)
        return ResourceData<List<CondominiosAtivosEntity>>(
            status: Status.success,
            data: CondominiosAtivosEntity().fromMapList(result));
      else
        return ResourceData<List<CondominiosAtivosEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar os condominios ativos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<UserAdmEntity>>> inforCondominios() async {
    try {
      final result = await _dio.get('condominios');

      if (result.length > 0)
        return ResourceData<List<UserAdmEntity>>(
            status: Status.success, data: UserAdmEntity().fromMapList(result));
      else
        return ResourceData<List<UserAdmEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar as informações dos condominios",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> sendCodigoAtivacao(String codigo) async {
    try {
      final result = await _dio.post('validar-codigo-ativacao/$codigo');

      return ResourceData(status: Status.success, data: result['status']);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao ativar o código",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<EmailAtivacaoEntity>>> getEmailsVinculados() async {
    try {
      final result = await _dio.get('login-emails');

      return ResourceData(
        status: Status.success,
        data: EmailAtivacaoEntity().fromMapList(result),
      );
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao gerar um novo Código",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<int>> gerarCodigoAtivacao(int idEmail) async {
    try {
      final result = await _dio.post('gerar-codigo-ativacao/$idEmail');

      return ResourceData(
        status: Status.success,
        data: result['status'],
      );
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao gerar um novo Código",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<int>> ativarCondominio(LoginAuthEntity credencial) async {
    try {
      final result = await _dio.post('loginConline', data: credencial.toMap());

      return ResourceData<int>(status: Status.success, data: result['status']);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao checar as informações dos condominios",
          error: ErrorMapper.from(e));
    }
  }
}

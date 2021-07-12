import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominios_ativos_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/data/mappers/condominio/condominio_mapper.dart';
import 'package:Gestart/data/mappers/user_adm/user_adm_mapper.dart';
import 'package:Gestart/data/mappers/condominio/condominio_ativo_mapper.dart';
import 'package:Gestart/data/mappers/condominio/condominios_ativos_mapper.dart';
import 'package:Gestart/domain/entities/user_adm/user_adm_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

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

  Future<ResourceData<UnidadeAtivaEntity>> condominioAtivo() async {
    try {
      final result = await _dio.get('condominiosAtivos');

      if (result.length > 0)
        return ResourceData<UnidadeAtivaEntity>(
            status: Status.success,
            data: UnidadeAtivaEntity().fromMap(result[0]));
      else
        return ResourceData<UnidadeAtivaEntity>(
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
}

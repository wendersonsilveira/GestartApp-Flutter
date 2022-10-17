import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/unidade/unidade_mapper.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_infor_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/data/mappers/unidade/unidade_infor_mapper.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class UnidadeRemoteDataSource {
  CustomDio _dio;
  UnidadeRemoteDataSource(this._dio);

  Future<ResourceData<List<UnidadeEntity>>> getUnidades() async {
    try {
      final result = await _dio.get('v2/unidadesAtivas');

      if (result.length > 0)
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: UnidadeEntity().fromMapList(result));
      else
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as unidades ativas",
          error: ErrorMapper.from(e));
    }
  }


  Future<ResourceData<List<UnidadeEntity>>> getUnidadesDoc(String cpfCnpj) async {
    try {
      final result = await _dio.get('v2/unidadesAtivas_doc/$cpfCnpj');

      if (result.length > 0)
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: UnidadeEntity().fromMapList(result));
      else
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as unidades ativas",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<UnidadeEntity>>> getUnidadesComplemento(codcon) async {
    try {
      final result = await _dio.get('adm-unidades-complemento/$codcon');

      if (result.length > 0)
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: UnidadeEntity().fromMapList(result));
      else
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as unidades ativas",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<UnidadeEntity>>> getUnidadesAdm() async {
    try {
      final result = await _dio.get('resumo');

      if (result.length > 0)
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success,
            data: UnidadeEntity().fromMapList(result['condominiosAtivosAdm']));
      else
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as unidades adm",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<UnidadeEntity>>> getUnidadesCondominio(
      filtros) async {
    try {
      final result = await _dio.post('get-unidades-condominio', data: filtros);

      if (result.length > 0)
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: UnidadeEntity().fromMapList(result));
      else
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as unidades adm",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<UnidadeEntity>>> getAdmUnidadesProprieraios(
      int codCon) async {
    try {
      final result = await _dio.get('adm-condon/$codCon');

      if (result.length > 0)
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: UnidadeEntity().fromMapList(result));
      else
        return ResourceData<List<UnidadeEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as unidades ativas",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<UnidadeInforEntity>>> getUnidadesFiltro(
      dynamic codCon) async {
    try {
      final result =
          await _dio.get('adm-unidades/$codCon');

      if (result.length > 0)
        return ResourceData<List<UnidadeInforEntity>>(
            status: Status.success, data: UnidadeInforEntity().fromMapList(result));
      else
        return ResourceData<List<UnidadeInforEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar resumo",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<UnidadeEntity>> getUnidadeDetalhes(
      int codOrd, int condonUserId) async {
    try {
      final result =
          await _dio.get('adm-unidades-detalhes/$codOrd/$condonUserId');

      if (result.length > 0)
        return ResourceData<UnidadeEntity>(
            status: Status.success, data: UnidadeEntity().fromMap(result));
      else
        return ResourceData<UnidadeEntity>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar resumo",
          error: ErrorMapper.from(e));
    }
  }
}

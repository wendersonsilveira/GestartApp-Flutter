import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/boleto/boleto_entity.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_entity.dart';
import 'package:Gestart/data/mappers/boleto/boleto_mapper.dart';
import 'package:Gestart/data/mappers/boleto/detalhe_boleto_mapper.dart';
import 'package:Gestart/data/mappers/boleto/detalhe_boleto_unidade_mapper.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_unidade_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class BoletoRemoteDataSource {
  CustomDio _dio;
  Dio dio;
  BoletoRemoteDataSource(this._dio);

  Future<ResourceData<List<BoletoEntity>>> getBoletos() async {
    try {
      final result = await _dio.get('faturas');
      return ResourceData<List<BoletoEntity>>(
          status: Status.success, data: BoletoEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os boletos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<BoletoEntity>>> getBoletosUnidade(int cordord) async {
    try {
      final result = await _dio.get('unidade_faturas/$cordord');
      return ResourceData<List<BoletoEntity>>(
          status: Status.success, data: BoletoEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os boletos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<DetalheBoletoUnidadeEntity>>> getBoletoUnidade(String conts) async {
    try {
      final result = await _dio.get('unidade_fatura_detalhe/$conts');
      return ResourceData<List<DetalheBoletoUnidadeEntity>>(
          status: Status.success, data: DetalheBoletoUnidadeEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os boletos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<DetalheBoletoEntity>> getBoleto(int codord) async {
    try {
      final result = await _dio.get('fatura/$codord');
      if (result.length > 0)
        return ResourceData<DetalheBoletoEntity>(
            status: Status.success,
            data: DetalheBoletoEntity().fromMap(result[0]));
      else
        return ResourceData<DetalheBoletoEntity>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar o boleto",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<String>> getLinkParcelamento(String identificador) async {
    try {
      final result = await dio.get(
          'http://condominioonline.gestartcondominios.com.br:8080/parcelamento/$identificador');
      print(result);
      // if (result.length > 0)
      //   return ResourceData<DetalheBoletoEntity>(
      //       status: Status.success,
      //       data: DetalheBoletoEntity().fromMap(result[0]));
      // else
      return ResourceData<String>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar o boleto",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<BoletoEntity>>> getBoletosDoc(String cpfCnpj) async {
    try {
      final result = await _dio.get('faturas_doc/$cpfCnpj');
      return ResourceData<List<BoletoEntity>>(
          status: Status.success, data: BoletoEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os boletos",
          error: ErrorMapper.from(e));
    }
  }

}

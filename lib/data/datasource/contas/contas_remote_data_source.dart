import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/contas/contas_mapper.dart';
import 'package:Gestart/data/mappers/contas/mov_financeiro_mapper.dart';
import 'package:Gestart/data/mappers/contas/mov_financeiro_meses_mapper.dart';
import 'package:Gestart/data/mappers/contas/extrato_financeiro_mapper.dart';
import 'package:Gestart/domain/entities/contas/extrato_financeiro_entity.dart';
import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_meses_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContasRemoteDataSource {
  CustomDio _dio;
  ContasRemoteDataSource(this._dio);

  Future<ResourceData<List<ContasEntity>>> getContas(int codCon) async {
    try {
      final result = await _dio.get('contasfixas/$codCon');
      return ResourceData<List<ContasEntity>>(
          status: Status.success, data: ContasEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as contas",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<MovFinanceiroEntity>>> getMovFinanceiro(
      MovFinanceiroEntity entity) async {
    try {
      final result =
          await _dio.get('movfin-resumo/${entity.codCon}/${entity.mesAno}');
      return ResourceData<List<MovFinanceiroEntity>>(
          status: Status.success,
          data: MovFinanceiroEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os movimentos financeiros",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<MovFinanceiroMesesEntity>>> getMovFinanceiroMeses(
      int codCon) async {
    try {
      final result = await _dio.get('movfin-meses/$codCon');
      return ResourceData<List<MovFinanceiroMesesEntity>>(
          status: Status.success,
          data: MovFinanceiroMesesEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as datas dos movimentos financeiros",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<ExtratoFinanceiroEntity>>> getExtratoFinanceiro(
      MovFinanceiroEntity entity) async {
    try {
      final result =
          await _dio.post('movfin-extrato', data: entity.toMapExtrato());
      return ResourceData<List<ExtratoFinanceiroEntity>>(
          status: Status.success,
          data: ExtratoFinanceiroEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar o extrato do periodo",
          error: ErrorMapper.from(e));
    }
  }
}

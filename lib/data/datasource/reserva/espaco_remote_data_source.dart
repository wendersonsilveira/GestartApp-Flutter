import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/reserva/espaco_mapper.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class EspacoRemoteDataSource {
  CustomDio _dio;
  EspacoRemoteDataSource(this._dio);

  Future<ResourceData<List<EspacoEntity>>> getEspacos(int codcon) async {
    try {
      final result = await _dio.get('espacos/$codcon');

      return ResourceData(
          status: Status.success,
          data: EspacoEntity().fromMapList(result),
          message: 'Espaços encontrados com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar espaços",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<EspacoEntity>> getEspaco(int espacoId) async {
    try {
      final result = await _dio.get('espaco/$espacoId');

      return ResourceData(
          status: Status.success,
          data: EspacoEntity().fromMap(result[0]),
          message: 'Espaço encontrado com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar espaço",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> criarEspaco(EspacoEntity espaco) async {
    try {
      final result = await _dio.post('espacos', data: espaco.toMap());

      return ResourceData(
          status: Status.success, message: 'Espaço cirado com sucesso!');
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao criar espaço",
          error: ErrorMapper.from(e));
    }
  }
}

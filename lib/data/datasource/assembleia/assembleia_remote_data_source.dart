import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/assembleia/assembleia_entity.dart';
import 'package:Gestart/data/mappers/assembleia/assembleia_mapper.dart';
import 'package:Gestart/data/mappers/assembleia/edital_mapper.dart';
import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AssembleiaRemoteDataSource {
  CustomDio _dio;
  AssembleiaRemoteDataSource(this._dio);

  Future<ResourceData<List<AssembleiaEntity>>> getEditais() async {
    try {
      final result = await _dio.get('editais');

      return ResourceData<List<AssembleiaEntity>>(
          status: Status.success, data: AssembleiaEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os editais",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<EditalEntity>>> getEdital(int id) async {
    try {
      final result = await _dio.get('edital/$id');
      return ResourceData<List<EditalEntity>>(
          status: Status.success, data: EditalEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar o edital",
          error: ErrorMapper.from(e));
    }
  }
}

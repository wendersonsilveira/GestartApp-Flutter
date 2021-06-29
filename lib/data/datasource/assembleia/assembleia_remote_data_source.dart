import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/assembleia/editais_entity.dart';
import 'package:Gestart/data/mappers/assembleia/editais_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AssembleiaRemoteDataSource {
  CustomDio _dio;
  AssembleiaRemoteDataSource(this._dio);

  Future<ResourceData<List<EditaisEntity>>> getEditais() async {
    try {
      final result = await _dio.get('editais');

      return ResourceData<List<EditaisEntity>>(
          status: Status.success, data: EditaisEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os editais",
          error: ErrorMapper.from(e));
    }
  }
}

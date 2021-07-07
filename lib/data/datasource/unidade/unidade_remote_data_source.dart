import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/unidade/unidade_mapper.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class UnidadeRemoteDataSource {
  CustomDio _dio;
  UnidadeRemoteDataSource(this._dio);

  Future<ResourceData<List<UnidadeEntity>>> getUnidades() async {
    try {
      final result = await _dio.get('unidadesAtivas');

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
}

import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/taxa/taxa_mapper.dart';
import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class TaxaRemoteDataSource {
  CustomDio _dio;
  TaxaRemoteDataSource(this._dio);

  Future<ResourceData<List<TaxaEntity>>> getTaxas(int codCon) async {
    try {
      final result = await _dio.get('get_taxas/$codCon');

      if (result.length > 0)
        return ResourceData<List<TaxaEntity>>(
            status: Status.success, data: TaxaEntity().fromMapList(result));
      else
        return ResourceData<List<TaxaEntity>>(status: Status.success, data: []);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as taxas",
          error: ErrorMapper.from(e));
    }
  }
}

import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/setup/setup_mapper.dart';
import 'package:Gestart/domain/entities/setup/setup_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetupRemoteDataSource {
  CustomDio _dio;
  SetupRemoteDataSource(this._dio);

  Future<ResourceData<SetupEntity>> getSetup(int codCon) async {
    try {
      final result = await _dio.get('setup/$codCon');

      if (result.length > 0)
        return ResourceData<SetupEntity>(
            status: Status.success, data: SetupEntity().fromMap(result));
      else
        return ResourceData<SetupEntity>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as unidades ativas",
          error: ErrorMapper.from(e));
    }
  }
}

import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/contas/contas_mapper.dart';
import 'package:Gestart/domain/entities/contas/contas_entity.dart';
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
}

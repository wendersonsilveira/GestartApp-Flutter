import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/data/mappers/comunicacao/aviso_mapper.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ComunicacaoRemoteDataSource {
  CustomDio _dio;
  ComunicacaoRemoteDataSource(this._dio);

  Future<ResourceData<List<AvisoEntity>>> getAvisos(int codCon) async {
    try {
      final result = await _dio.get('adm-avisos/$codCon');

      return ResourceData(status: Status.success, data: AvisoEntity().fromMapList(result), message: 'Avisos listados com sucesso!');
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao listar os avisos", error: ErrorMapper.from(e));
    }
  }
}

import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/documento/documento_mapper.dart';
import 'package:Gestart/domain/entities/documento/documento_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class DocumentoRemoteDataSource {
  CustomDio _dio;
  DocumentoRemoteDataSource(this._dio);

  Future<ResourceData<List<DocumentoEntity>>> getDocumentos() async {
    try {
      final result = await _dio.get('documentos');
      if (result.length > 0)
        return ResourceData<List<DocumentoEntity>>(
            status: Status.success,
            data: DocumentoEntity().fromMapList(result));
      else
        return ResourceData<List<DocumentoEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os documentos",
          error: ErrorMapper.from(e));
    }
  }
}

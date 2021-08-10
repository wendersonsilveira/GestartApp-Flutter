import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/adm-cadastros/resumo_unidade_mapper.dart';
import 'package:Gestart/domain/entities/admin-cadastro/resumo_unidade_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/data/mappers/unidade/unidade_mapper.dart';

import 'package:injectable/injectable.dart';

@injectable
class ResumoUnidadeRemoteDataSource {
  CustomDio _dio;
  ResumoUnidadeRemoteDataSource(this._dio);

  Future<ResourceData<ResumoUnidadeEntity>> getResumoUnidade(int codCon) async {
    try {
      final result = await _dio.get('adm-resumo-unidades/$codCon');

      if (result.length > 0)
        return ResourceData<ResumoUnidadeEntity>(status: Status.success, data: ResumoUnidadeEntity().fromMap(result));
      else
        return ResourceData<ResumoUnidadeEntity>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao listar resumo", error: ErrorMapper.from(e));
    }
  }
}

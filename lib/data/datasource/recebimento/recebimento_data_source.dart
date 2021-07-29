import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/recebimento/recebimento_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/tipo_taxa_mapper.dart';
import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecebimentoRemoteDataSource {
  CustomDio _dio;

  RecebimentoRemoteDataSource(this._dio);

  Future<ResourceData<List<RecebimentoEntity>>> getRecebimentos(int codCon, Map<String, dynamic> filtro) async {
    try {
      final result = await _dio.post('adm-recebimentos/$codCon', data: filtro);
      if (result.length > 0)
        return ResourceData<List<RecebimentoEntity>>(status: Status.success, data: RecebimentoEntity().fromMapList(result));
      else
        return ResourceData<List<RecebimentoEntity>>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao listar as recebimentos", error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<TipoTaxaEntity>>> getTiposTaxas(int codCon) async {
    try {
      final result = await _dio.get('condom-tipos-taxas/$codCon');
      if (result.length > 0)
        return ResourceData<List<TipoTaxaEntity>>(status: Status.success, data: TipoTaxaEntity().fromMapList(result));
      else
        return ResourceData<List<TipoTaxaEntity>>(status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(status: Status.failed, data: null, message: "Erro ao listar as recebimentos", error: ErrorMapper.from(e));
    }
  }
}

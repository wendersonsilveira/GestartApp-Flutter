import 'package:Gestart/data/helpers/error_mapper.dart';
import 'package:Gestart/data/remote/custom_dio.dart';
import 'package:Gestart/data/mappers/recebimento/recebimento_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/tipo_taxa_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/inadim_historico_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/pagamento_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/inadimplencia_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/acordo_mapper.dart';
import 'package:Gestart/domain/entities/recebimento/acrodo_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_detalhe_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';
import 'package:Gestart/domain/entities/recebimento/pagamento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_processos_entity.dart';
import 'package:Gestart/data/mappers/recebimento/inadimplencia_adm_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/send_params_rel_inadimplencia_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/inadimplencia_adm_detalhe_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/inadimplencia_incidencia_mapper.dart';
import 'package:Gestart/data/mappers/recebimento/inadimplencia_processo_mapper.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecebimentoRemoteDataSource {
  CustomDio _dio;

  RecebimentoRemoteDataSource(this._dio);

  Future<ResourceData<List<RecebimentoEntity>>> getRecebimentos(
      int codCon, Map<String, dynamic> filtro) async {
    try {
      final result = await _dio.post('adm-recebimentos/$codCon', data: filtro);
      if (result.length > 0)
        return ResourceData<List<RecebimentoEntity>>(
            status: Status.success,
            data: RecebimentoEntity().fromMapList(result));
      else
        return ResourceData<List<RecebimentoEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os recebimentos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<TipoTaxaEntity>>> getTiposTaxas(int codCon) async {
    try {
      final result = await _dio.get('condom-tipos-taxas/$codCon');
      if (result.length > 0)
        return ResourceData<List<TipoTaxaEntity>>(
            status: Status.success, data: TipoTaxaEntity().fromMapList(result));
      else
        return ResourceData<List<TipoTaxaEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os recebimentos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<PagamentoEntity>>> getPagamentos(
      Map<String, dynamic> filtro) async {
    try {
      final result = await _dio.post('adm-recebimentos-detalhes', data: filtro);
      if (result.length > 0)
        return ResourceData<List<PagamentoEntity>>(
            status: Status.success,
            data: PagamentoEntity().fromMapList(result));
      else
        return ResourceData<List<PagamentoEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os pagamentos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<InadimplenciaAdmEntity>>> getInadimplenciasAdm(
      SendParamsRelInadimplenciaEntity params) async {
    try {
      final result =
          await _dio.post('get_adm_inadimplencia', data: params.toMap());
      if (result.length > 0)
        return ResourceData<List<InadimplenciaAdmEntity>>(
            status: Status.success,
            data: InadimplenciaAdmEntity().fromMapList(result));
      else
        return ResourceData<List<InadimplenciaAdmEntity>>(
            status: Status.success, data: []);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os inadimplências",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<InadimplenciaAdmDetalheEntity>>>
      getInadimplenciasUnidade(SendParamsRelInadimplenciaEntity params) async {
    try {
      final result = await _dio.post('detalhar-inadimplencias-unidade',
          data: params.toMap());
      if (result.length > 0)
        return ResourceData<List<InadimplenciaAdmDetalheEntity>>(
            status: Status.success,
            data: InadimplenciaAdmDetalheEntity().fromMapList(result));
      else
        return ResourceData<List<InadimplenciaAdmDetalheEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os recebimentos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<InadimplenciaEntity>>> getInadimplencias(
      int codCon, Map<String, dynamic> filtro) async {
    try {
      final result = await _dio.post('adm-inadim/$codCon', data: filtro);
      if (result.length > 0)
        return ResourceData<List<InadimplenciaEntity>>(
            status: Status.success,
            data: InadimplenciaEntity().fromMapList(result));
      else
        return ResourceData<List<InadimplenciaEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os recebimentos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<InadimplenciaEntity>>> getInadimplencia(
      Map<String, dynamic> filtro) async {
    try {
      final result = await _dio.post('adm-inadim-detalhes', data: filtro);
      if (result.length > 0)
        return ResourceData<List<InadimplenciaEntity>>(
            status: Status.success,
            data: InadimplenciaEntity().fromMapList(result));
      else
        return ResourceData<List<InadimplenciaEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar as inadimplencias",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<IncidenciaInadimplenciasEntity>>>
      getIncidenciasInadimplencias(int codOrd) async {
    try {
      final result = await _dio.get('adm-inadim-detalhes-incidencias/$codOrd');
      if (result.length > 0)
        return ResourceData<List<IncidenciaInadimplenciasEntity>>(
            status: Status.success,
            data: IncidenciaInadimplenciasEntity().fromMapList(result));
      else
        return ResourceData<List<IncidenciaInadimplenciasEntity>>(
            status: Status.success, data: []);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os incidências",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<HistoricoInadimEntity>>> getHistoricoInadim(
      int codOrd) async {
    try {
      final result = await _dio.get('adm-inadim-detalhes-historico/$codOrd');
      if (result.length > 0)
        return ResourceData<List<HistoricoInadimEntity>>(
            status: Status.success,
            data: HistoricoInadimEntity().fromMapList(result));
      else
        return ResourceData<List<HistoricoInadimEntity>>(
            status: Status.success, data: []);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os historicos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<ProcessoInadimplenciasEntity>>> getProcessosInadim(
      int codOrd) async {
    try {
      final result = await _dio.get('adm-inadim-detalhes-processos/$codOrd');
      if (result.length > 0)
        return ResourceData<List<ProcessoInadimplenciasEntity>>(
            status: Status.success,
            data: ProcessoInadimplenciasEntity().fromMapList(result));
      else
        return ResourceData<List<ProcessoInadimplenciasEntity>>(
            status: Status.success, data: []);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os processos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<AcordoEntity>>> getAcordos(int codCon) async {
    try {
      final result = await _dio.get('acordos/$codCon');
      return ResourceData<List<AcordoEntity>>(
          status: Status.success, data: AcordoEntity().fromMapList(result));
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os acordos",
          error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData<List<AcordoEntity>>> getAcordo(int numAco) async {
    try {
      final result = await _dio.get('acordo/$numAco');
      if (result.length > 0)
        return ResourceData<List<AcordoEntity>>(
            status: Status.success, data: AcordoEntity().fromMapList(result));
      else
        return ResourceData<List<AcordoEntity>>(
            status: Status.success, data: null);
    } on DioError catch (e) {
      return ResourceData(
          status: Status.failed,
          data: null,
          message: "Erro ao listar os acordos",
          error: ErrorMapper.from(e));
    }
  }
}

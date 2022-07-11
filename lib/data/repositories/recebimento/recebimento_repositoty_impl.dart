import 'package:Gestart/data/datasource/recebimento/recebimento_data_source.dart';
import 'package:Gestart/domain/entities/recebimento/acrodo_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';
import 'package:Gestart/domain/entities/recebimento/pagamento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/repositories/recebimento/recebimento_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class RecebimentoRepositoryImpl implements RecebimentoRepository {
  RecebimentoRemoteDataSource _recebimentoRemoteDataSource;

  RecebimentoRepositoryImpl(this._recebimentoRemoteDataSource);

  @override
  Future<ResourceData<List<RecebimentoEntity>>> getRecebimentos(
      Map<String, dynamic> filtro) async {
    int codCon = filtro['CODCON'];
    filtro.remove('CODCON');
    final resource =
        await _recebimentoRemoteDataSource.getRecebimentos(codCon, filtro);

    return resource;
  }

  @override
  Future<ResourceData<List<TipoTaxaEntity>>> getTiposTaxa(int codCon) async {
    final resource = await _recebimentoRemoteDataSource.getTiposTaxas(codCon);

    return resource;
  }

  @override
  Future<ResourceData<List<PagamentoEntity>>> getPagamentos(
      Map<String, dynamic> filtro) async {
    final resource = await _recebimentoRemoteDataSource.getPagamentos(filtro);

    return resource;
  }

  @override
  Future<ResourceData<List<InadimplenciaEntity>>> getInadimplencias(
      Map<String, dynamic> filtro) async {
    int codCon = filtro['CODCON'];
    filtro.remove('CODCON');
    final resource =
        await _recebimentoRemoteDataSource.getInadimplencias(codCon, filtro);

    return resource;
  }

  @override
  Future<ResourceData<List<InadimplenciaEntity>>> getInadimplencia(
      Map<String, dynamic> filtro) async {
    final resource =
        await _recebimentoRemoteDataSource.getInadimplencia(filtro);

    return resource;
  }

  @override
  Future<ResourceData<List<HistoricoInadimEntity>>> getHistoricoInadim(
      int codOrd) async {
    final resource =
        await _recebimentoRemoteDataSource.getHistoricoInadim(codOrd);

    return resource;
  }

  @override
  Future<ResourceData<List<AcordoEntity>>> getAcordos(int codCon) async {
    final resource = await _recebimentoRemoteDataSource.getAcordos(codCon);

    return resource;
  }

  @override
  Future<ResourceData<List<AcordoEntity>>> getAcordo(int numAco) async {
    final resource = await _recebimentoRemoteDataSource.getAcordo(numAco);

    return resource;
  }

  @override
  Future<ResourceData<List<InadimplenciaAdmEntity>>> getInadimplenciasAdm(
      SendParamsRelInadimplenciaEntity params) async {
    final resource =
        await _recebimentoRemoteDataSource.getInadimplenciasAdm(params);

    return resource;
  }
}

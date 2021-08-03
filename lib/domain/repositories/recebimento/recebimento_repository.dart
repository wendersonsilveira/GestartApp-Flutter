import 'package:Gestart/domain/entities/recebimento/acrodo_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';
import 'package:Gestart/domain/entities/recebimento/pagamento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class RecebimentoRepository {
  Future<ResourceData<List<RecebimentoEntity>>> getRecebimentos(Map<String, dynamic> filtro);
  Future<ResourceData<List<TipoTaxaEntity>>> getTiposTaxa(int codCon);
  Future<ResourceData<List<PagamentoEntity>>> getPagamentos(Map<String, dynamic> filtro);
  Future<ResourceData<List<InadimplenciaEntity>>> getInadimplencias(Map<String, dynamic> filtro);
  Future<ResourceData<List<InadimplenciaEntity>>> getInadimplencia(Map<String, dynamic> filtro);
  Future<ResourceData<List<HistoricoInadimEntity>>> getHistoricoInadim(int codOrd);
  Future<ResourceData<List<AcordoEntity>>> getAcordos(int codCon);
  Future<ResourceData<List<AcordoEntity>>> getAcordo(int numAco);
}

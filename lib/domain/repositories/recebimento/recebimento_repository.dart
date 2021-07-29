import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class RecebimentoRepository {
  Future<ResourceData<List<RecebimentoEntity>>> getRecebimentos(Map<String, dynamic> filtro);
  Future<ResourceData<List<TipoTaxaEntity>>> getTiposTaxa(int codCon);
}

import 'package:Gestart/domain/entities/admin-cadastro/resumo_unidade_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class ResumoUnidadeRepository {
  Future<ResourceData<ResumoUnidadeEntity>> getResumoUnidade(int codCon);
}

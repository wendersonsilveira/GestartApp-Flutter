import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class UnidadeRepository {
  Future<ResourceData<List<UnidadeEntity>>> getUnidades(reservaAtiva);
  Future<ResourceData<List<UnidadeEntity>>> getUnidadesAdm();
  Future<ResourceData<List<UnidadeEntity>>> getAdmUnidadesProprieraios(
      int codCon);
  Future<ResourceData<List<UnidadeEntity>>> getUnidadesFiltro(
      Map<String, dynamic> filtro);
  Future<ResourceData<UnidadeEntity>> getUnidadeDetalhes(
      Map<String, dynamic> ids);
}

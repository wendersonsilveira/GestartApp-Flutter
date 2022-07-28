import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_infor_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class UnidadeRepository {
  Future<ResourceData<List<UnidadeEntity>>> getUnidades();
  Future<ResourceData<List<UnidadeEntity>>> getUnidadesComplemento(codcon);
  Future<ResourceData<List<UnidadeEntity>>> getUnidadesAdm();
  Future<ResourceData<List<UnidadeEntity>>> getUnidadesCondominio(filtro);
  Future<ResourceData<List<UnidadeEntity>>> getAdmUnidadesProprieraios(
      int codCon);
  Future<ResourceData<List<UnidadeInforEntity>>> getUnidadesFiltro(codcon);
  Future<ResourceData<UnidadeEntity>> getUnidadeDetalhes(
      Map<String, dynamic> ids);
}

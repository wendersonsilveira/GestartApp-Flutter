import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class UnidadeRepository {
  Future<ResourceData<List<UnidadeEntity>>> getUnidades();
  Future<ResourceData<List<UnidadeEntity>>> getUnidadesAdm();
}

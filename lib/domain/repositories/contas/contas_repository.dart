import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class ContasRepository {
  Future<ResourceData<List<ContasEntity>>> getContas(int codCon);
}

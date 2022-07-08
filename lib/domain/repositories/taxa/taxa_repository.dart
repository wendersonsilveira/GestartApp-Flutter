import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class TaxaRepository {
  Future<ResourceData<List<TaxaEntity>>> getTaxa(int codCon);
}

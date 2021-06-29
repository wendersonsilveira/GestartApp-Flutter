import 'package:Gestart/domain/entities/assembleia/editais_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class AssembleiaRepository {
  Future<ResourceData<List<EditaisEntity>>> getEditais();
}

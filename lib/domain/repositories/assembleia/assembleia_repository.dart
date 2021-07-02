import 'package:Gestart/domain/entities/assembleia/assembleia_entity.dart';
import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class AssembleiaRepository {
  Future<ResourceData<List<AssembleiaEntity>>> getEditais();
  Future<ResourceData<List<EditalEntity>>> getEdital(int id);
}

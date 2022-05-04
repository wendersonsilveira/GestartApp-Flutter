import 'package:Gestart/domain/entities/setup/setup_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class SetupRepository {
  Future<ResourceData<SetupEntity>> getSetup(codCon);
}

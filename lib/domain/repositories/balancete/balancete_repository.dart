import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class BalanceteRepository {
  Future<ResourceData<List<BalanceteEntity>>> getBalancetes();
}

import 'package:Gestart/data/datasource/balancete/balancete_data_source.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/repositories/balancete/balancete_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class BalanceteRepositoryImpl implements BalanceteRepository {
  BalanceteRemoteDataSource _balanceteRemoteDataSource;

  BalanceteRepositoryImpl(this._balanceteRemoteDataSource);

  @override
  Future<ResourceData<List<BalanceteEntity>>> getBalancetes() async {
    final resource = await _balanceteRemoteDataSource.getBalancetes();

    return resource;
  }
}

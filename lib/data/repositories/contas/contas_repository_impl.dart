import 'package:Gestart/data/datasource/contas/contas_remote_data_source.dart';

import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_meses_entity.dart';
import 'package:Gestart/domain/repositories/contas/contas_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class ContasRepositoryImpl implements ContasRepository {
  ContasRemoteDataSource _contasRemoteDataSource;

  ContasRepositoryImpl(this._contasRemoteDataSource);

  @override
  Future<ResourceData<List<ContasEntity>>> getContas(int codCon) async {
    final resource = await _contasRemoteDataSource.getContas(codCon);

    return resource;
  }

  @override
  Future<ResourceData<List<MovFinanceiroEntity>>> getMovFinanceiro(
      MovFinanceiroEntity entity) async {
    final resource = await _contasRemoteDataSource.getMovFinanceiro(entity);

    return resource;
  }

  @override
  Future<ResourceData<List<MovFinanceiroMesesEntity>>> getMovFinanceiroMeses(
      int codCon) async {
    final resource =
        await _contasRemoteDataSource.getMovFinanceiroMeses(codCon);

    return resource;
  }
}

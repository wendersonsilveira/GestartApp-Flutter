import 'package:Gestart/data/datasource/unidade/unidade_remote_data_source.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/repositories/unidade/unidade_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class UnidadeRepositoryImpl implements UnidadeRepository {
  UnidadeRemoteDataSource _unidadeRemoteDataSource;

  UnidadeRepositoryImpl(this._unidadeRemoteDataSource);

  @override
  Future<ResourceData<List<UnidadeEntity>>> getUnidades() async {
    final resource = await _unidadeRemoteDataSource.getUnidades();

    return resource;
  }
}

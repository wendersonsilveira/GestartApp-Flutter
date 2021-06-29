import 'package:Gestart/data/datasource/assembleia/assembleia_remote_data_source.dart';
import 'package:Gestart/domain/entities/assembleia/editais_entity.dart';
import 'package:Gestart/domain/repositories/assembleia/assembleia_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class AssembleiaRepositoryImpl implements AssembleiaRepository {
  AssembleiaRemoteDataSource _assembleiaRemoteDataSource;

  AssembleiaRepositoryImpl(this._assembleiaRemoteDataSource);

  @override
  Future<ResourceData<List<EditaisEntity>>> getEditais() async {
    final resource = await _assembleiaRemoteDataSource.getEditais();

    return resource;
  }
}

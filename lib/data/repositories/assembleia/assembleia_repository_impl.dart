import 'package:Gestart/data/datasource/assembleia/assembleia_remote_data_source.dart';
import 'package:Gestart/domain/entities/assembleia/assembleia_entity.dart';
import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:Gestart/domain/repositories/assembleia/assembleia_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class AssembleiaRepositoryImpl implements AssembleiaRepository {
  AssembleiaRemoteDataSource _assembleiaRemoteDataSource;

  AssembleiaRepositoryImpl(this._assembleiaRemoteDataSource);

  @override
  Future<ResourceData<List<AssembleiaEntity>>> getEditais() async {
    final resource = await _assembleiaRemoteDataSource.getEditais();

    return resource;
  }

  @override
  Future<ResourceData<List<EditalEntity>>> getEdital(int id) async {
    final resource = await _assembleiaRemoteDataSource.getEdital(id);

    return resource;
  }
}

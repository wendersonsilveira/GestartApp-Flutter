import 'package:Gestart/data/datasource/setup/setup_remote_data_source.dart';
import 'package:Gestart/domain/entities/setup/setup_entity.dart';
import 'package:Gestart/domain/repositories/setup/setup_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class SetupRepositoryImpl implements SetupRepository {
  SetupRemoteDataSource _setupRemoteDataSource;

  SetupRepositoryImpl(this._setupRemoteDataSource);

  @override
  Future<ResourceData<SetupEntity>> getSetup(codCon) async {
    final resource = await _setupRemoteDataSource.getSetup(codCon);

    return resource;
  }
}

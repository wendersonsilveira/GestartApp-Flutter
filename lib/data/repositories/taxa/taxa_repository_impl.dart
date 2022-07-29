import 'package:Gestart/data/datasource/taxa/taxa_remote_data_source.dart';
import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';
import 'package:Gestart/domain/repositories/taxa/taxa_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class TaxaRepositoryImpl implements TaxaRepository {
  TaxaRemoteDataSource _taxaRemoteDataSource;

  TaxaRepositoryImpl(this._taxaRemoteDataSource);

  @override
  Future<ResourceData<List<TaxaEntity>>> getTaxa(int codCon) async {
    final resource = await _taxaRemoteDataSource.getTaxas(codCon);

    return resource;
  }
}

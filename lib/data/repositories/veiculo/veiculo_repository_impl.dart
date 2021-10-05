import 'package:Gestart/data/datasource/veiculo/veiculo_remote_data_source.dart';
import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/repositories/veiculo/veiculo_repository.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

class VeiculoRepositoryImpl implements VeiculoRepository {
  VeiculoRemoteDataSource _veiculoRemoteDataSource;

  VeiculoRepositoryImpl(this._veiculoRemoteDataSource);

  @override
  Future<ResourceData> createVeiculo(VeiculoEntity veiculo) async {
    final resource = await _veiculoRemoteDataSource.createVeiculo(veiculo);

    return resource;
  }

  @override
  Future<ResourceData<List<VeiculoEntity>>> getVeiculos() async {
    final resource = await _veiculoRemoteDataSource.getVeiculos();

    return resource;
  }

  @override
  Future<ResourceData<VeiculoEntity>> getVeiculo(int id) async {
    final resource = await _veiculoRemoteDataSource.getVeiculo(id);

    return resource;
  }

  @override
  Future<ResourceData> deleteVeiculo(int id) async {
    final resource = await _veiculoRemoteDataSource.deleteVeiculo(id);

    return resource;
  }
}

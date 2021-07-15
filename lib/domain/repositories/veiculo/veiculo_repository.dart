import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';

abstract class VeiculoRepository {
  Future<ResourceData> createVeiculo(VeiculoEntity veiculo);
  Future<ResourceData<List<VeiculoEntity>>> getVeiculos();
  Future<ResourceData<VeiculoEntity>> getVeiculo(int id);
  Future<ResourceData> deleteVeiculo(int id);
}

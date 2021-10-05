import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/repositories/veiculo/veiculo_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetVeiculoUseCase extends BaseFutureUseCase<int, ResourceData<VeiculoEntity>> {
  VeiculoRepository _veiculoRepository;

  GetVeiculoUseCase(this._veiculoRepository);

  @override
  Future<ResourceData<VeiculoEntity>> call([int id]) {
    return _veiculoRepository.getVeiculo(id);
  }
}

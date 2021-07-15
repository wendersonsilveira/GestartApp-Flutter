import 'package:Gestart/domain/repositories/veiculo/veiculo_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteVeiculoUseCase extends BaseFutureUseCase<int, ResourceData> {
  VeiculoRepository _veiculoRepository;

  DeleteVeiculoUseCase(this._veiculoRepository);

  @override
  Future<ResourceData> call([int id]) {
    return _veiculoRepository.deleteVeiculo(id);
  }
}

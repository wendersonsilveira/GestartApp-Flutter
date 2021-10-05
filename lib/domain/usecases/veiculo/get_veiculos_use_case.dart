import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/repositories/veiculo/veiculo_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetVeiculosUseCase extends BaseFutureUseCase<void, ResourceData<List<VeiculoEntity>>> {
  VeiculoRepository _veiculoRepository;

  GetVeiculosUseCase(this._veiculoRepository);

  @override
  Future<ResourceData<List<VeiculoEntity>>> call([void veiculo]) {
    return _veiculoRepository.getVeiculos();
  }
}

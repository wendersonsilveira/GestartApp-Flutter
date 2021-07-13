import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/repositories/reserva/espaco_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEspacoUseCase
    extends BaseFutureUseCase<int, ResourceData<EspacoEntity>> {
  EspacoRepository _espacoRepository;

  GetEspacoUseCase(this._espacoRepository);

  @override
  Future<ResourceData<EspacoEntity>> call([int espacoId]) {
    return _espacoRepository.getEspaco(espacoId);
  }
}

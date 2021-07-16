import 'package:Gestart/domain/repositories/reserva/espaco_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExcluirEspacoUseCase extends BaseFutureUseCase<int, ResourceData> {
  EspacoRepository _espacoRepository;

  ExcluirEspacoUseCase(this._espacoRepository);

  @override
  Future<ResourceData> call([int idEspaco]) {
    return _espacoRepository.excluirEspaco(idEspaco);
  }
}

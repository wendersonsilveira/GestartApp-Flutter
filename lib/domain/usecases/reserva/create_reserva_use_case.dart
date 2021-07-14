import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateReservaUseCase extends BaseFutureUseCase<dynamic, ResourceData> {
  ReservaRepository _reservaRepository;

  CreateReservaUseCase(this._reservaRepository);

  @override
  Future<ResourceData> call([dynamic data]) {
    return _reservaRepository.criarReserva(data);
  }
}

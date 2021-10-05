import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CancelarReservaUseCase extends BaseFutureUseCase<int, ResourceData> {
  ReservaRepository _reservaRepository;

  CancelarReservaUseCase(this._reservaRepository);

  @override
  Future<ResourceData> call([int id]) {
    return _reservaRepository.cancelarReserva(id);
  }
}

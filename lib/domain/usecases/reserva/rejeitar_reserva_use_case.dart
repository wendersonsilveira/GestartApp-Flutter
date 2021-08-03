import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class RejeitarReservaUseCase extends BaseFutureUseCase<int, ResourceData> {
  ReservaRepository _reservaRepository;

  RejeitarReservaUseCase(this._reservaRepository);

  @override
  Future<ResourceData> call([int reservaId]) {
    return _reservaRepository.rejeitarReserva(reservaId);
  }
}

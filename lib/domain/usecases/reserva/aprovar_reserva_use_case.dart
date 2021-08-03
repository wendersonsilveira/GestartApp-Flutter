import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class AprovarReservaUseCase extends BaseFutureUseCase<int, ResourceData> {
  ReservaRepository _reservaRepository;

  AprovarReservaUseCase(this._reservaRepository);

  @override
  Future<ResourceData> call([int reservaId]) {
    return _reservaRepository.aprovarReserva(reservaId);
  }
}

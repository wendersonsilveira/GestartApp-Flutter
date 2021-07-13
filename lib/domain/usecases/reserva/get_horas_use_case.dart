import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHorasUseCase extends BaseFutureUseCase<void, ResourceData<List<HoraEntity>>> {
  ReservaRepository _reservaRepository;

  GetHorasUseCase(this._reservaRepository);

  @override
  Future<ResourceData<List<HoraEntity>>> call([void rerserva]) {
    return _reservaRepository.getHoras();
  }
}

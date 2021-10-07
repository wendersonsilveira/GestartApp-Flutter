import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetReservaUseCase
    extends BaseFutureUseCase<int, ResourceData<ReservaEntity>> {
  ReservaRepository _reservaRepository;

  GetReservaUseCase(this._reservaRepository);

  @override
  Future<ResourceData<ReservaEntity>> call([int idReserva]) {
    return _reservaRepository.getReserva(idReserva);
  }
}

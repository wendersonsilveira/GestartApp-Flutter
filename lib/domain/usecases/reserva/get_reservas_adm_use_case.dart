import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetReservasAdmUseCase
    extends BaseFutureUseCase<int, ResourceData<List<ReservaEntity>>> {
  ReservaRepository _reservaRepository;

  GetReservasAdmUseCase(this._reservaRepository);

  @override
  Future<ResourceData<List<ReservaEntity>>> call([int codCon]) {
    return _reservaRepository.getReservasAdm(codCon);
  }
}

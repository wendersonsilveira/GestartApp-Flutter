import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/repositories/reserva/reserva_repository.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetReservasRelatorioUseCase
    extends BaseFutureUseCase<dynamic, ResourceData<List<ReservaEntity>>> {
  ReservaRepository _reservaRepository;

  GetReservasRelatorioUseCase(this._reservaRepository);

  @override
  Future<ResourceData<List<ReservaEntity>>> call([dynamic params]) {
    return _reservaRepository.getReservasRelatorio(params);
  }
}

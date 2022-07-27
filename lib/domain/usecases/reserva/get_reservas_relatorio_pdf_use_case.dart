import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/domain/usecases/base/base_future_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetReservasRelatorioPDFUseCase extends BaseFutureUseCase<
    SendParamsRelReservaEntity, ResourceData<dynamic>> {
  // ReservaRepository _reservaRepository;

  // GetReservasRelatorioPDFUseCase(this._reservaRepository);

  @override
  Future<ResourceData<dynamic>> call([SendParamsRelReservaEntity params]) {
    // return _reservaRepository.getReservasRelatorioPDF(params);
  }
}

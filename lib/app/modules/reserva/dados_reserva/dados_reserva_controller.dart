import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/usecases/reserva/cancelar_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reserva_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dados_reserva_controller.g.dart';

@Injectable()
class DadosReservaController = _DadosReservaControllerBase
    with _$DadosReservaController;

abstract class _DadosReservaControllerBase with Store {
  final _cancelarReserva = getIt.get<CancelarReservaUseCase>();

  final _getReserva = getIt.get<GetReservaUseCase>();

  @observable
  ResourceData<ReservaEntity> reserva = ResourceData(status: Status.loading);

  @action
  init(int idReserva) async {
    reserva = await _getReserva(idReserva);
    print(reserva.data);
  }

  @action
  Future<ResourceData> cancelarReserva(int id) {
    return _cancelarReserva(id);
  }
}

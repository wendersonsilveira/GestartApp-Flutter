import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/usecases/reserva/cancelar_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reservas_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'reserva_controller.g.dart';

@Injectable()
class ReservaController = _ReservaControllerBase with _$ReservaController;

abstract class _ReservaControllerBase with Store {
  final _getReservas = getIt.get<GetReservasUseCase>();
  @observable
  List<ReservaEntity> reservas;
  final _cancelarReserva = getIt.get<CancelarReservaUseCase>();

  @action
  getReservas() async {
    reservas = null;
    final r = await _getReservas();
    reservas = r.data;
  }

  @action
  Future<ResourceData> cancelarReserva(int id) {
    return _cancelarReserva(id);
  }
}

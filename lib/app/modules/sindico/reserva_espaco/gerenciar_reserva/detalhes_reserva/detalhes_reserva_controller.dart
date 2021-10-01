import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_reserva_adm_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/aprovar_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/rejeitar_reserva_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhes_reserva_controller.g.dart';

@Injectable()
class DetalhesReservaController = _DetalhesReservaControllerBase
    with _$DetalhesReservaController;

abstract class _DetalhesReservaControllerBase with Store {
  final _getReserva = getIt.get<GetReservaAdmUseCase>();
  final _aprovarReserva = getIt.get<AprovarReservaUseCase>();
  final _rejeitarReserva = getIt.get<RejeitarReservaUseCase>();

  @observable
  ResourceData<ReservaEntity> reserva;

  @observable
  ResourceData statusAprovar;

  @observable
  ResourceData statusRejeitar;

  init(int idReserva) async {
    reserva = ResourceData(status: Status.loading);
    reserva = await _getReserva(idReserva);
  }

  @action
  Future<ResourceData> aprovarReserva(int reservaId) async {
    statusAprovar = await _aprovarReserva(reservaId);
    return statusAprovar;
  }

  @action
  Future<ResourceData> rejeitarReserva(int reservaId) async {
    statusRejeitar = await _rejeitarReserva(reservaId);
    return statusRejeitar;
  }
}

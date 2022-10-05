import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/usecases/reserva/aprovar_reserva_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reservas_adm_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/rejeitar_reserva_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:string_validator/string_validator.dart';

part 'reservas_pendentes_controller.g.dart';

@Injectable()
class ReservasPendentesController = _ReservasPendentesControllerBase
    with _$ReservasPendentesController;

abstract class _ReservasPendentesControllerBase with Store {
  final _getReservasAdm = getIt.get<GetReservasAdmUseCase>();
  final _aprovarReserva = getIt.get<AprovarReservaUseCase>();
  final _rejeitarReserva = getIt.get<RejeitarReservaUseCase>();

  @observable
  ResourceData<List<ReservaEntity>> reservasAdm;

  @observable
  List<ReservaEntity> reservasPendentes = [];

  @observable
  List<ReservaEntity> reservasPendentesData = [];

  @observable
  ResourceData statusAprovar;

  @observable
  ResourceData statusRejeitar;

  int codCon;

  @action
  init() async {
    reservasAdm = ResourceData(status: Status.loading);
    codCon = await UIHelper.getStorageInt('codCon');
    reservasAdm = await _getReservasAdm(codCon);
    inserirReservasPendentes();
  }

  @action
  inserirReservasPendentes() {
    reservasPendentes = reservasAdm.data
        .where((element) =>
            element.status == 0 &&
            element.datIni
                .add(
                  Duration(
                    hours: int.parse(
                            element.horIniDescricao.trim().split(':')[0]) + 3,
                    minutes: int.parse(element.horIniDescricao.trim().split(':')[1].split(' ')[0])
                  ),
                )
                .isAfter(DateTime.now().toUtc()))
        .toList();
    print(reservasPendentes);
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

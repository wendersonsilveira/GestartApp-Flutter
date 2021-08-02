import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_reservas_adm_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'calendario_controller.g.dart';

@Injectable()
class CalendarioController = _CalendarioControllerBase
    with _$CalendarioController;

abstract class _CalendarioControllerBase with Store {
  final _getReservasAdm = getIt.get<GetReservasAdmUseCase>();

  @observable
  List<ReservaEntity> reservasAdm = [];

  @observable
  Map<DateTime, List<DateTime>> eventos = {};

  @observable
  List<ReservaEntity> reservaAdmDia = [];

  @observable
  ResourceData r;

  int codCon;

  @action
  init() async {
    r = ResourceData(status: Status.loading);
    codCon = await UIHelper.getStorageInt('codCon');
    r = await _getReservasAdm(codCon);
    reservasAdm = r.data;

    for (ReservaEntity item in reservasAdm) {
      if (item.data != null) {
        eventos[item.data] = [item.data];
      }
    }
  }

  @action
  inserirReservasDia(DateTime date) {
    reservaAdmDia = reservasAdm
        .where((element) =>
            UIHelper.formatDate(element.data) == UIHelper.formatDate(date))
        .toList();

    print(reservaAdmDia);
  }
}

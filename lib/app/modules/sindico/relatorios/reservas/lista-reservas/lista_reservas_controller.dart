import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_reservas_relatorio_use_case.dart';
import 'package:Gestart/domain/usecases/user/get_perfil_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Gestart/domain/utils/status.dart';

part 'lista_reservas_controller.g.dart';

@Injectable()
class ListaReservasController = _ListaReservasControllerBase
    with _$ListaReservasController;

abstract class _ListaReservasControllerBase with Store {
  SendParamsRelReservaEntity params;
  ResourceData<dynamic> documentPDF;

  @observable
  int codCon;

  final _getReservas = getIt.get<GetReservasRelatorioUseCase>();
  final _getPerfil = getIt.get<GetPerfilUseCase>();

  @observable
  ResourceData<List<ReservaEntity>> reservas =
      ResourceData(status: Status.loading);

  @observable
  ResourceData<List<ReservaEntity>> reservasPDF =
      ResourceData(status: Status.loading);

  @observable
  ResourceData<UserEntity> perfil;

  @action
  Future<void> getReservas(params) async {
    reservas = await _getReservas(params);
    print(reservas);
  }

  @action
  Future<void> getPerfil() async {
    perfil = await _getPerfil();
  }

  init(params) async {
    await getPerfil();
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');
    await getReservas(params);
  }

}

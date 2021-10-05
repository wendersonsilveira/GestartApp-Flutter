import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/usecases/reserva/excluir_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_espacos_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_reservas_adm_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'listar_espacos_controller.g.dart';

@Injectable()
class ListarEspacosController = _ListarEspacosControllerBase
    with _$ListarEspacosController;

abstract class _ListarEspacosControllerBase with Store {
  final _getEspaco = getIt.get<GetEspacosUseCase>();
  final _excluirEspaco = getIt.get<ExcluirEspacoUseCase>();
  final _getReservasAdm = getIt.get<GetReservasAdmUseCase>();

  int condcon;

  @observable
  ResourceData<List<EspacoEntity>> espacos;

  @observable
  ResourceData statusExcluirEspaco;

  @observable
  ResourceData<List<ReservaEntity>> reservas;

  @observable
  int value = 0;

  init() async {
    espacos = ResourceData(status: Status.loading);
    this.condcon = await UIHelper.getStorageInt('codCon');
    espacos = await _getEspaco(this.condcon);
  }

  Future<int> checarSeExisteReservas(int espacoId) async {
    reservas = await _getReservasAdm(condcon);
    var result = reservas.data
        .where((element) => element.espacoId == espacoId)
        .toList()
        .length;
    return result;
  }

  Future<ResourceData> excluirEspaco(int idEspaco) async {
    statusExcluirEspaco = await _excluirEspaco(idEspaco);
    return statusExcluirEspaco;
  }
}

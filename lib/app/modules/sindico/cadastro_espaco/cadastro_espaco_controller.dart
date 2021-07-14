import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_horarios_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_horas_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastro_espaco_controller.g.dart';

@Injectable()
class CadastroEspacoController = _CadastroEspacoControllerBase
    with _$CadastroEspacoController;

abstract class _CadastroEspacoControllerBase with Store {
  final _getHorarios = getIt.get<GetHorasUseCase>();

  @observable
  ResourceData<List<HoraEntity>> horarios;

  @observable
  int tempoMinPermanencia;

  @observable
  int tempoMaxPermanencia;

  @observable
  int tempoMinAntecedencia;

  @observable
  int tempoMaxAntecedencia;

  @observable
  int tempoIntervaloReserva;

  @observable
  bool ativarDom = true;
  @observable
  bool ativarSeg = true;
  @observable
  bool ativarTer = true;
  @observable
  bool ativarQua = true;
  @observable
  bool ativarQui = true;
  @observable
  bool ativarSex = true;
  @observable
  bool ativarSab = true;

  @action
  statusDom() {
    ativarDom = !ativarDom;
  }

  @observable
  int domIni;
  @observable
  int domFim;
  @observable
  int segIni;
  @observable
  int segFim;
  @observable
  int terIni;
  @observable
  int terFim;
  @observable
  int quaIni;
  @observable
  int quaFim;
  @observable
  int quiIni;
  @observable
  int quiFim;
  @observable
  int sexIni;
  @observable
  int sexFim;
  @observable
  int sabIni;
  @observable
  int sabFim;

  @action
  init() async {
    horarios = ResourceData(status: Status.loading);
    horarios = await _getHorarios();
  }

  enviarParametros() {}

  setMinPer(int idTempo) {
    tempoMinPermanencia = idTempo;
  }

  setMaxPer(int idTempo) {
    tempoMaxPermanencia = idTempo;
  }

  setMinAnt(int idTempo) {
    tempoMinAntecedencia = idTempo;
  }

  setMaxAnt(int idTempo) {
    tempoMaxAntecedencia = idTempo;
  }

  setIntRes(int idTempo) {
    tempoIntervaloReserva = idTempo;
  }
}

import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/usecases/reserva/criar_espaco_use_case.dart';
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
  final _criarEspaco = getIt.get<CriarEspacoUseCase>();

  enviarParametros(String nome, capacidade, obs) async {
    _criarEspaco(EspacoEntity(
        codcon: int.parse(this.cond),
        descricao: nome,
        capacidade: int.parse(capacidade),
        obs: obs,
        perMin: this.tempoMinPermanencia,
        perMax: this.tempoMaxPermanencia,
        antMin: this.tempoMinAntecedencia,
        antMax: this.tempoMaxPermanencia,
        intRes: this.tempoIntervaloReserva,
        dom: this.ativarDom,
        domIni: this.domIni,
        domFim: this.domFim,
        seg: this.ativarSeg,
        segIni: this.segIni,
        segFim: this.segFim,
        ter: this.ativarTer,
        terIni: this.terIni,
        terFim: this.terFim,
        qua: this.ativarQua,
        quaIni: this.quaIni,
        quaFim: this.quaFim,
        qui: this.ativarQui,
        quiIni: this.quiIni,
        quiFim: this.quiFim,
        sex: this.ativarSex,
        sexIni: this.sexIni,
        sexFim: this.sexFim,
        sab: this.ativarSab,
        sabIni: this.sabIni,
        sabFim: this.sabFim,
        aprovacao: this.autorizacaoResponsavel,
        apenasMaster: this.apenasProprietarioReserva));
  }

  String cond;

  @observable
  ResourceData<List<HoraEntity>> horarios;

  @observable
  ResourceData statusCriacao;

  @observable
  int tempoMinPermanencia = 1;

  @observable
  int tempoMaxPermanencia = 1;

  @observable
  int tempoMinAntecedencia = 1;

  @observable
  int tempoMaxAntecedencia = 1;

  @observable
  int tempoIntervaloReserva = 1;

  @action
  setPerMin(value) => tempoMinPermanencia = value;

  @action
  setPerMax(value) => tempoMaxPermanencia = value;

  @action
  setAntMin(value) => tempoMinAntecedencia = value;

  @action
  setAntMax(value) => tempoMaxAntecedencia = value;

  @action
  setTempIntervaloReserva(value) => tempoIntervaloReserva = value;

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
  @observable
  bool autorizacaoResponsavel = true;
  @observable
  bool apenasProprietarioReserva = true;

  @action
  statusAutorizacaoResponsavel() {
    autorizacaoResponsavel = !autorizacaoResponsavel;
  }

  @action
  statusapenasProprietarioReserva() {
    apenasProprietarioReserva = !apenasProprietarioReserva;
  }

  @action
  statusDom() {
    ativarDom = !ativarDom;
  }

  @action
  statusSeg() {
    ativarSeg = !ativarSeg;
  }

  @action
  statusTer() {
    ativarTer = !ativarTer;
  }

  @action
  statusQua() {
    ativarQua = !ativarQua;
  }

  @action
  statusQui() {
    ativarQui = !ativarQui;
  }

  @action
  statusSex() {
    ativarSex = !ativarSex;
  }

  @action
  statusSab() {
    ativarSab = !ativarSab;
  }

  @observable
  int domIni = 1;
  @observable
  int domFim = 1;
  @observable
  int segIni = 1;
  @observable
  int segFim = 1;
  @observable
  int terIni = 1;
  @observable
  int terFim = 1;
  @observable
  int quaIni = 1;
  @observable
  int quaFim = 1;
  @observable
  int quiIni = 1;
  @observable
  int quiFim = 1;
  @observable
  int sexIni = 1;
  @observable
  int sexFim = 1;
  @observable
  int sabIni = 1;
  @observable
  int sabFim = 1;

  @action
  setHorarioDomIni(value) => domIni = value;

  @action
  setHorarioDomFim(value) => domFim = value;

  @action
  setHorarioSegIni(value) => segIni = value;

  @action
  setHorarioSegFim(value) => segFim = value;
  @action
  setHorarioTerIni(value) => terIni = value;

  @action
  setHorarioTerFim(value) => terFim = value;
  @action
  setHorarioQuaIni(value) => quaIni = value;

  @action
  setHorarioQuaFim(value) => quaFim = value;
  @action
  setHorarioQuiIni(value) => quiIni = value;

  @action
  setHorarioQuiFim(value) => quiFim = value;
  @action
  setHorarioSexIni(value) => sexIni = value;

  @action
  setHorarioSexFim(value) => sexFim = value;
  @action
  setHorarioSabIni(value) => sabIni = value;

  @action
  setHorarioSabFim(value) => sabFim = value;

  @action
  init() async {
    horarios = ResourceData(status: Status.loading);
    horarios = await _getHorarios();
    this.cond = await UIHelper.getStorage('cond');
  }

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

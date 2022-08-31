import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/setup/setup_entity.dart';
import 'package:Gestart/domain/usecases/reserva/criar_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_espaco_use_id.dart';
import 'package:Gestart/domain/usecases/reserva/get_horas_use_case.dart';
import 'package:Gestart/domain/usecases/setup/get_setup_use_case.dart';
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
  final _getEspaco = getIt.get<GetEspacoUseCase>();
  final _getSetup = getIt.get<GetSetupUseCase>();

  @observable
  ResourceData<List<HoraEntity>> horarios;

  @observable
  ResourceData<SetupEntity> setup;

  @observable
  ResourceData statusCriacao;

  @observable
  ResourceData<EspacoEntity> espacoEditar;

  int cond;
  @observable
  List<HoraEntity> horariosIntRes = [];

  @action
  init() async {
    horarios = ResourceData(status: Status.loading);
    horarios = await _getHorarios();
    setup = await _getSetup(0);

    this.cond = await UIHelper.getStorageInt('codCon');
  }

  Future<ResourceData<EspacoEntity>> getEspaco(int idEspaco) async {
    espacoEditar = await _getEspaco(idEspaco);
    setarValores(espacoEditar.data);
    return espacoEditar;
  }

  // setarValoresIntRes() {
  //   horariosIntRes = horarios.data
  //       .where((element) => element.id <= setup.data.setupReserva.maxIntRes)
  //       .toList();
  // }

  setarValores(EspacoEntity espaco) {
    this.tempoMinPermanencia = espaco.perMin;
    this.tempoMaxPermanencia = espaco.perMax;
    this.tempoMinAntecedencia = espaco.antMin;
    this.tempoMaxAntecedencia = espaco.antMax;
    this.tempoIntervaloReserva = espaco.intRes;
    this.ativarDom = espaco.dom;
    this.domIni = espaco.domIni;
    this.domFim = espaco.domFim;
    this.ativarSeg = espaco.seg;
    this.segIni = espaco.segIni;
    this.segFim = espaco.segFim;
    this.ativarTer = espaco.ter;
    this.terIni = espaco.terIni;
    this.terFim = espaco.terFim;
    this.ativarQua = espaco.qua;
    this.quaIni = espaco.quaIni;
    this.quaFim = espaco.quaFim;
    this.ativarQui = espaco.qui;
    this.quiIni = espaco.quiIni;
    this.quiFim = espaco.quiFim;
    this.ativarSex = espaco.sex;
    this.sexIni = espaco.sexIni;
    this.sexFim = espaco.sexFim;
    this.ativarSab = espaco.sab;
    this.sabIni = espaco.sabIni;
    this.sabFim = espaco.sabFim;
    this.apenasProprietarioReserva = espaco.apenasMaster;
    this.autorizacaoResponsavel = espaco.aprovacao;
    this.statusEspaco = espaco.statusEspaco;
  }

  Future<ResourceData> enviarParametros(
      String nome, capacidade, obs, int id) async {
    EspacoEntity espaco = id != null
        ? EspacoEntity(
            id: id,
            codcon: this.cond,
            descricao: nome,
            capacidade: int.parse(capacidade),
            obs: obs,
            perMin: this.tempoMinPermanencia,
            perMax: this.tempoMaxPermanencia,
            antMin: this.tempoMinAntecedencia,
            antMax: this.tempoMaxAntecedencia,
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
            statusEspaco: this.statusEspaco,
            apenasMaster: this.apenasProprietarioReserva,
          )
        : EspacoEntity(
            codcon: this.cond,
            descricao: nome,
            capacidade: int.parse(capacidade),
            obs: obs,
            perMin: this.tempoMinPermanencia,
            perMax: this.tempoMaxPermanencia,
            antMin: this.tempoMinAntecedencia,
            antMax: this.tempoMaxAntecedencia,
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
            statusEspaco: this.statusEspaco,
            apenasMaster: this.apenasProprietarioReserva,
          );
    statusCriacao = await _criarEspaco(espaco);

    return statusCriacao;
  }

  @observable
  int tempoMinPermanencia = 1;

  @observable
  int tempoMaxPermanencia = 16;

  @observable
  int tempoMinAntecedencia = 1;

  @observable
  int tempoMaxAntecedencia = 8;

  @observable
  int tempoIntervaloReserva = 1;

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
  bool statusEspaco = true;
  @observable
  bool apenasProprietarioReserva = true;

  @action
  setarValoresIntRes() {
    horariosIntRes = horarios.data
        .where((element) => element.id <= setup.data.setupReserva.maxIntRes)
        .toList();
  }

  @action
  statusAutorizacaoResponsavel() {
    autorizacaoResponsavel = !autorizacaoResponsavel;
  }

  @action
  changeStatusEspaco() {
    statusEspaco = !statusEspaco;
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
  int domIni = 16;
  @observable
  int domFim = 44;
  @observable
  int segIni = 16;
  @observable
  int segFim = 44;
  @observable
  int terIni = 16;
  @observable
  int terFim = 44;
  @observable
  int quaIni = 16;
  @observable
  int quaFim = 44;
  @observable
  int quiIni = 16;
  @observable
  int quiFim = 44;
  @observable
  int sexIni = 16;
  @observable
  int sexFim = 44;
  @observable
  int sabIni = 16;
  @observable
  int sabFim = 44;

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
}

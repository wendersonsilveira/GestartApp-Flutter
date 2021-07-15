import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_espaco_use_id.dart';
import 'package:Gestart/domain/usecases/reserva/get_horarios_espaco_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/get_horas_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/data/mappers/reserva/espaco_mapper.dart';

part 'horarios_controller.g.dart';

@Injectable()
class HorariosController = _HorariosControllerBase with _$HorariosController;

abstract class _HorariosControllerBase with Store {
  final _getHorariosEspaco = getIt.get<GetHorariosEspacosUseCase>();
  final _getEspaco = getIt.get<GetEspacoUseCase>();
  final _getHoras = getIt.get<GetHorasUseCase>();

  @observable
  List<HorarioEspacoEntity> horarios;
  @observable
  EspacoEntity espaco;
  @observable
  bool isLoading = false;
  @observable
  bool checkingPerm = false;
  @observable
  String erroMsg;
  @observable
  int horaIn;
  @observable
  int horaFi;
  @observable
  List<HoraEntity> horariosTotais = [];
  @observable
  List<HoraEntity> horariosDisponiveis = [];
  @observable
  List<HoraEntity> horariosFinal = [];

  @observable
  Map<String, dynamic> espacoJSON;

  var reserva = {
    'CODCON': '',
    'CODORD': '',
    'ESPACO_ID': '',
    'ESPACO_DESCRICAO': '',
    'APELIDO': '',
    'DATINI': '',
    'DATINI_ORIGINAL': UIHelper.formatDateFromDateTime(DateTime.now()),
    'HORINI_ID': 0,
    'HORINI_DESCRICAO': '',
    'HORFIM_ID': 0,
    'HORFIM_DESCRICAO': ''
  };

  @action
  getHorariosEspaco(DateTime data) async {
    isLoading = true;
    String d = UIHelper.formatDateFromDateTimeReverse(data);
    reserva['DATINI'] = d;

    final r = await _getHorariosEspaco(espaco.id, d);
    horarios = r.data;
    isLoading = false;
  }

  @action
  setCodOrd(int codord) {
    reserva['CODORD'] = codord;
  }

  @action
  getEspaco(int espacoId) async {
    final r = await _getEspaco(espacoId);

    espaco = r.data;
    espacoJSON = espaco.toMap();
  }

  @action
  setHorarioIn(int hIni) {
    horaIn = hIni;
  }

  @action
  setHorarioFi(int hFim) {
    horaFi = hFim;
  }

  @action
  criarHorariosDisponiveis() async {
    final r = await _getHoras();
    horariosTotais = r.data;
    horariosDisponiveis = r.data.where((element) => element.id >= horaIn && element.id <= horaFi).toList();
  }

  @action
  setHorariosFinal() {
    horariosFinal = horariosDisponiveis.where((element) => element.id > horaIn).toList();
  }

  @action
  Future<String> salvarHorario() {
    if ((horaFi - horaIn) > espaco.perMax) {
      final permMax = horariosTotais.firstWhere((element) => element.id == espaco.perMax);
      return Future(() => 'A permanência máxima é de ${permMax.descricao}');
    }

    if ((horaFi - horaIn) < espaco.perMin) {
      final permMim = horariosTotais.firstWhere((element) => element.id == espaco.perMin);
      return Future(() => 'A permanência mínima é de ${permMim.descricao}');
    }

    return null;
  }

  @action
  criarJSONReserva() async {
    final horaInId = horariosTotais.firstWhere((element) => element.id == horaIn);
    final horaFiId = horariosTotais.firstWhere((element) => element.id == horaFi);

    reserva['CODCON'] = espaco.codcon;
    reserva['ESPACO_ID'] = espaco.id;
    reserva['ESPACO_DESCRICAO'] = espaco.descricao;
    reserva['APELIDO'] = espaco.apelido;
    reserva['HORINI_ID'] = horaInId.id;
    reserva['HORINI_DESCRICAO'] = horaInId.descricao;
    reserva['HORFIM_ID'] = horaFiId.id;
    reserva['HORFIM_DESCRICAO'] = horaFiId.descricao;
  }

  @action
  setLoaginPerm(bool per) {
    checkingPerm = per;
  }

  @action
  setMsgErro(String msg) {
    erroMsg = msg;
  }
}

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
  int horaIn;
  @observable
  int horaFi;

  @observable
  List<HoraEntity> horariosTotais = [];

  @observable
  List<HoraEntity> horariosDisponiveis = [];

  @observable
  List<HoraEntity> horariosFinal = [];

  @action
  getHorariosEspaco(DateTime data) async {
    isLoading = true;
    String d = UIHelper.formatDateFromDateTimeReverse(data);

    final r = await _getHorariosEspaco(espaco.id, d);
    horarios = r.data;
    isLoading = false;
  }

  @action
  getEspaco(int espacoId) async {
    final r = await _getEspaco(espacoId);

    espaco = r.data;
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
  checarPermanencia() {}

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

  Future<String> salvarHorario() {
    if ((horaFi - horaIn) > espaco.perMax) {
      final permMax = horariosTotais.firstWhere((element) => element.id == espaco.perMax);
      return Future(() => 'A permanência máxima é ${permMax.descricao}');
    }

    if ((horaFi - horaIn) < espaco.perMin) {
      final permMim = horariosTotais.firstWhere((element) => element.id == espaco.perMin);
      return Future(() => 'A permanência mínima é ${permMim.descricao}');
    }

    return null;
  }
}

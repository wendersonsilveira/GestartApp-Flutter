import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/reserva/horarios_espaco_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_espaco_use_id.dart';
import 'package:Gestart/domain/usecases/reserva/get_horarios_espaco_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'horarios_controller.g.dart';

@Injectable()
class HorariosController = _HorariosControllerBase with _$HorariosController;

abstract class _HorariosControllerBase with Store {
  final _getHorariosEspaco = getIt.get<GetHorariosEspacosUseCase>();
  final _getEspaco = getIt.get<GetEspacoUseCase>();

  @observable
  List<HorarioEspacoEntity> horarios;
  @observable
  EspacoEntity espaco;
  @observable
  bool isLoading = false;
  @observable
  String horaIn;
  @observable
  String horaFi;

  @observable
  List<String> horariosDisponiveis = [];

  @observable
  List<String> horariosFinal = [];

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
  setHorarioIn(String hIni) {
    horaIn = hIni;
  }

  @action
  setHorarioFi(String hFim) {
    horaFi = hFim;
  }

  @action
  checarPermanencia() {}

  @action
  criarHorariosDisponiveis(h) {
    horariosDisponiveis = [];
    var horario = horarios.where((element) => element.horIniDescricao == h);
    String hi = horario.first.horIniDescricao.replaceAll(RegExp(r' hr'), '');
    List haI = hi.split(':');
    String hf = horario.first.horfimDescricao.replaceAll(RegExp(r' hr'), '');
    List haF = hf.split(':');

    int mIni = int.parse(haI[1]);
    bool state = true;

    for (var i = int.parse(haI[0]); i <= int.parse(haF[0]); i++) {
      if (i == int.parse(haF[0])) {
        state = false;
        if (int.parse(haF[1]) > 30) {
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:00 hr');
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:30 hr');
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:${haF[1]} hr');
        } else if (int.parse(haF[1]) > 0) {
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:00 hr');
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:${haF[1]} hr');
        } else {
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:${haF[1]} hr');
        }
      }

      if (state) {
        if (mIni > 0) {
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:$mIni hr');
          mIni = 0;
        } else {
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:00 hr');
          mIni = 30;
          horariosDisponiveis.add('${i < 10 ? '0' + i.toString() : i}:$mIni hr');
        }
        mIni = 0;
      }
    }

    horariosDisponiveis.sort();
  }

  @action
  setHorariosFinal() {
    horariosFinal = [];
    bool iniHoraF = false;
    List<String> l = [];
    horariosDisponiveis.forEach((h) {
      if (h == horaIn) {
        iniHoraF = true;
      }

      if (iniHoraF) {
        l.add(h);
      }
    });

    horariosFinal = l;

    print(horariosFinal);
  }
}

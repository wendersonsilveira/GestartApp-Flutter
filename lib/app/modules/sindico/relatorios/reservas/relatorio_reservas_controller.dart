import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_espacos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_condominio_use_case.dart';
import 'package:Gestart/domain/utils/status.dart';

part 'relatorio_reservas_controller.g.dart';

@Injectable()
class RelatorioReservasController = _RelatorioReservasControllerBase
    with _$RelatorioReservasController;

abstract class _RelatorioReservasControllerBase with Store {
  final _getUnidades = getIt.get<GetUnidadesCondominioUseCase>();
  final _getEspacos = getIt.get<GetEspacosUseCase>();

  @observable
  ResourceData<List<EspacoEntity>> espacos =
      ResourceData(status: Status.loading);

  @observable
  ResourceData<List<UnidadeEntity>> unidades =
      ResourceData(status: Status.loading);

  int codCon = 0;
  String unidadeSelecionada;
  String espacoSelecionado;
  String dataIni;
  String dataFim;
  int statusSelecionado;

  dynamic filtros = {};

  @action
  setUnidade(value) => unidadeSelecionada = value;
  @action
  setEspaco(value) => espacoSelecionado = value;

  @action
  setDataInicial(value) => dataIni = value;

  @action
  setDataFinal(value) => dataFim = value;

  @action
  setStatus(value) => statusSelecionado = value;

  setFiltros() {
    filtros["CODCON"] = codCon;
    filtros["TESTE"] = null;
  }

  init() async {
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');
    await getUnidades();
    await getEspacos();
    setFiltros();
    print(filtros);
  }

  @action
  Future<void> getUnidades() async {
    filtros = {"CODCON": codCon};
    unidades = await _getUnidades(filtros);
    print(unidades.data);
  }

  @action
  Future<void> getEspacos() async {
    espacos = await _getEspacos(codCon);
    print(espacos.data);
  }
}

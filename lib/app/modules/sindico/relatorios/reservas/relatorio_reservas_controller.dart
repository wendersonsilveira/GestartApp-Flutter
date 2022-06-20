import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/reserva/get_espacos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_condominio_use_case.dart';
import 'package:Gestart/domain/utils/status.dart';

import 'lista-reservas/lista_reservas_page.dart';

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

  @action
  setUnidade(value) => unidadeSelecionada = value;
  @action
  setEspaco(value) => espacoSelecionado = value;

  @action
  setDataInicial(value) => dataIni = value;

  @action
  setDataFinal(value) => dataFim = value;

  @action
  setStatus(value) {
    switch (value) {
      case "Aguardando aprovação":
        statusSelecionado = 0;
        break;
      case "Ativo":
        statusSelecionado = 1;
        break;
      case "Rejeitado":
        statusSelecionado = 2;
        break;
      default:
        statusSelecionado = 3;
    }
  }

  setFiltros() {
    SendParamsRelReservaEntity params = SendParamsRelReservaEntity(
        codCon: codCon,
        codimo: unidadeSelecionada,
        status: statusSelecionado,
        espaco: espacoSelecionado,
        dataIni: dataIni,
        dataFim: dataFim);

    Modular.navigator.pushNamed(RouteName.listaReservas, arguments: params);
  }

  init() async {
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');
    await getUnidades();
    await getEspacos();
    // setFiltros();
    // print(filtros);
  }

  @action
  Future<void> getUnidades() async {
    unidades = await _getUnidades({"CODCON": codCon});
    print(unidades.data);
  }

  @action
  Future<void> getEspacos() async {
    espacos = await _getEspacos(codCon);
    print(espacos.data);
  }
}

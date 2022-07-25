import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_adm_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sindico_controller.g.dart';

@Injectable()
class SindicoController = _SindicoControllerBase with _$SindicoController;

abstract class _SindicoControllerBase with Store {
  final _getUnidades = getIt.get<GetUnidadesAdmUseCase>();

  @observable
  ResourceData<List<UnidadeEntity>> unidades;

  @observable
  int codCon;

  final List<dynamic> menus = [
    {'icon': Icons.ac_unit, 'title': 'Reserva de Espaço', 'indice': 1},
    {'icon': Icons.ac_unit, 'title': 'Controle de Recebimentos', 'indice': 2},
    {'icon': Icons.ac_unit, 'title': 'Financeiro', 'indice': 3},
    {'icon': Icons.ac_unit, 'title': 'Comunicação', 'indice': 4},
    {'icon': Icons.ac_unit, 'title': 'Cadastros', 'indice': 5},
    {'icon': Icons.ac_unit, 'title': 'Relatórios', 'indice': 6}
  ];

  @observable
  UnidadeEntity unidadeSelecionada;

  init() async {
    unidades = ResourceData(status: Status.loading);
    unidades = await _getUnidades();

    var storage = await SharedPreferences.getInstance();
    int cod = storage.getInt('codCon');

    if (codCon == null) {
      if (cod != null) {
        codCon = cod;
        storage.setInt('codCon', codCon);
      } else {
        codCon = unidades.data[0].codcon;
        storage.setInt('codCon', codCon);
      }
    } else {
      codCon = unidades.data[0].codcon;
    }
  }
}

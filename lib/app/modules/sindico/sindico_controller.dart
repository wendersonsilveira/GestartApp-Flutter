import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_adm_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sindico_controller.g.dart';

@Injectable()
class SindicoController = _SindicoControllerBase with _$SindicoController;

abstract class _SindicoControllerBase with Store {
  final _getUnidades = getIt.get<GetUnidadesAdmUseCase>();

  @observable
  ResourceData<List<UnidadeEntity>> unidades;

  final List<dynamic> menus = [
    {
      'icon': FlutterIcons.calendar_account_mco,
      'title': 'Reserva de Espaço',
      'indice': 1
    },
    {
      'icon': FlutterIcons.hand_holding_usd_faw5s,
      'title': 'Controle de Recebimentos',
      'indice': 2
    },
    {'icon': FlutterIcons.usd_faw, 'title': 'Financeiro', 'indice': 3},
    {'icon': FlutterIcons.rss_ent, 'title': 'Comunicação', 'indice': 4},
    {'icon': FlutterIcons.id_card_faw, 'title': 'Cadastros', 'indice': 5},
  ];

  @observable
  UnidadeEntity unidadeSelecionada;

  init() async {
    unidades = ResourceData(status: Status.loading);
    unidades = await _getUnidades();
  }

  @action
  alterarSelecao(value) {
    unidadeSelecionada =
        unidades.data.firstWhere((element) => element.codord == value);
    print(unidadeSelecionada);
  }

  // @action
  // changeDropdown(int codOrd) =>
  //     listaView = boletos.data.where((i) => i.codord == codOrd).toList();
}

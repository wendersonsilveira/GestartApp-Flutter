import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/taxa/get_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_condominio_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'relatorio_inadimplencia_controller.g.dart';

@Injectable()
class RelatorioInadimplenciaController = _RelatorioInadimplenciaControllerBase
    with _$RelatorioInadimplenciaController;

abstract class _RelatorioInadimplenciaControllerBase with Store {
  final _getAllUnidades = getIt.get<GetUnidadesCondominioUseCase>();
  final _getAllTiposTaxa = getIt.get<GetTaxasUseCase>();

  int codCon;
  String codImo;
  int codOrd;
  String dataIni;
  String dataFim;
  String tipTax;
  String tipCob;

  @observable
  ResourceData<List<UnidadeEntity>> unidades =
      ResourceData(status: Status.loading);

  @observable
  ResourceData<List<TaxaEntity>> tiposTaxa =
      ResourceData(status: Status.loading, data: []);

  @observable
  List<TaxaEntity> selectedTaxas = [];
  List<String> _codTaxas = [];

  @action
  insertSelectedTaxas(List<TaxaEntity> taxas) => selectedTaxas = taxas;

  @action
  removedTaxa(TaxaEntity taxa) => selectedTaxas.remove(taxa);

  @action
  setDataInicial(value) => dataIni = value;

  @action
  seUnidade(int value) => codOrd = value;

  @action
  setDataFinal(value) => dataFim = value;

  @action
  setTipCob(value) {
    switch (value) {
      case "Administrativo":
        tipCob = 'A';
        break;
      case "Jurídico":
        tipCob = 'J';
        break;
      default:
        tipCob = null;
    }
  }

  @action
  setTipTax(value) => tipTax = value;

  setFiltros() {
    // selectedTaxas.map((e) => {_codTaxas.add(e.tiptax)});
    _codTaxas = selectedTaxas.map((e) => (e.tiptax)).toList();
    SendParamsRelInadimplenciaEntity params = SendParamsRelInadimplenciaEntity(
        codCon: codCon,
        codOrd: codOrd,
        codImo: codImo,
        datIni: dataIni,
        datFim: dataFim,
        tipCob: tipCob,
        tipTax: _codTaxas.isEmpty ? null : _codTaxas);

    print(params);

    Modular.to.pushNamed(RouteName.listarInadimplencia, arguments: params);
  }

  init() async {
    var storage = await SharedPreferences.getInstance();
    codCon = storage.getInt('codCon');
    await getUnidades();
    await getTiposTaxa();
    print('filtros');
  }

  @action
  getUnidades() async {
    unidades = await _getAllUnidades({'CODCON': codCon});
    print(unidades);
  }

  @action
  getTiposTaxa() async {
    tiposTaxa = await _getAllTiposTaxa(codCon);
    print(tiposTaxa);
  }
}

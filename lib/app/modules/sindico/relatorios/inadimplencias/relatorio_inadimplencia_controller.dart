import 'package:Gestart/di/di.dart';
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

  @observable
  ResourceData<List<UnidadeEntity>> unidades =
      ResourceData(status: Status.loading);

  @observable
  ResourceData<List<TaxaEntity>> tiposTaxa =
      ResourceData(status: Status.loading);

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

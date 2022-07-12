import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_adm_detalhe_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_historico_inadim_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_adm_incidencias_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_detalhe_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';

part 'detalhar_unidade_controller.g.dart';

@Injectable()
class DetalharUnidadeController = _DetalharUnidadeControllerBase
    with _$DetalharUnidadeController;

abstract class _DetalharUnidadeControllerBase with Store {
  final _getInadimplenciasUnidade =
      getIt.get<GetInadimplenciasAdmUseDetalheUseCase>();

  final _getHistoricoInadimplenciasUnidade =
      getIt.get<GetHistoricoInadimUseCase>();

  final _getIncidenciasInadimplenciasUnidade =
      getIt.get<GetInadimplenciasAdmIncidenciasUseCase>();

  ResourceData<List<InadimplenciaAdmDetalheEntity>> inadimplenciasUnidade;

  ResourceData<List<HistoricoInadimEntity>> historicoInadimplenciasUnidade;

  ResourceData<List<IncidenciaInadimplenciasEntity>>
      incidenciasInadimplenciasUnidade;

  init(SendParamsRelInadimplenciaEntity params) async {
    await getInadimplenciasUnidade(params);
    await getHistoricoInadimplenciasUnidade(params.codOrd);
    await getIncidenciasInadimplenciasUnidade(params.codOrd);
    print('filtros');
  }

  @action
  getInadimplenciasUnidade(SendParamsRelInadimplenciaEntity params) async {
    inadimplenciasUnidade = await _getInadimplenciasUnidade(params);
    // print(inadimplenciasUnidade);
  }

  @action
  getHistoricoInadimplenciasUnidade(int codOrd) async {
    historicoInadimplenciasUnidade =
        await _getHistoricoInadimplenciasUnidade(codOrd);
    print(historicoInadimplenciasUnidade);
  }

  @action
  getIncidenciasInadimplenciasUnidade(int codOrd) async {
    incidenciasInadimplenciasUnidade =
        await _getIncidenciasInadimplenciasUnidade(codOrd);
    print(incidenciasInadimplenciasUnidade);
  }
}

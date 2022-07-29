import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_incidencias_entity.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_adm_incidencias_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'incidencias_inadimplencia_controller.g.dart';

@Injectable()
class IncidenciasInadimplenciaController = _IncidenciasIndimplenciaControllerBase
    with _$IncidenciasInadimplenciaController;

abstract class _IncidenciasIndimplenciaControllerBase with Store {
  final _getIncidenciasInadimplenciasUnidade =
      getIt.get<GetInadimplenciasAdmIncidenciasUseCase>();

  @observable
  ResourceData<List<IncidenciaInadimplenciasEntity>>
      incidenciasInadimplenciasUnidade = ResourceData(status: Status.loading);

  init(SendParamsRelInadimplenciaEntity params) async {
    await getIncidenciasInadimplenciasUnidade(params.codOrd);
  }

  @action
  getIncidenciasInadimplenciasUnidade(int codOrd) async {
    incidenciasInadimplenciasUnidade =
        await _getIncidenciasInadimplenciasUnidade(codOrd);
    print(incidenciasInadimplenciasUnidade);
  }
}

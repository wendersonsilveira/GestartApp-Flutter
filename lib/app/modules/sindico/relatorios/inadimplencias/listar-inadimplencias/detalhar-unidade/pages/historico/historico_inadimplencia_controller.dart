import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_historico_inadim_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'historico_inadimplencia_controller.g.dart';

@Injectable()
class HistoricoInadimplenciaController = _HistoricoIndimplenciaControllerBase
    with _$HistoricoInadimplenciaController;

abstract class _HistoricoIndimplenciaControllerBase with Store {
  final _getHistoricoInadimplenciasUnidade =
      getIt.get<GetHistoricoInadimUseCase>();

  @observable
  ResourceData<List<HistoricoInadimEntity>> historicoInadimplenciasUnidade =
      ResourceData(status: Status.loading);

  init(SendParamsRelInadimplenciaEntity params) async {
    await getHistoricoInadimplenciasUnidade(params.codOrd);
  }

  @action
  getHistoricoInadimplenciasUnidade(int codOrd) async {
    historicoInadimplenciasUnidade =
        await _getHistoricoInadimplenciasUnidade(codOrd);
    print(historicoInadimplenciasUnidade);
  }
}

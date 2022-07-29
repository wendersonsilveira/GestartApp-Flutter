import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_processos_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_adm_processos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'processos_inadimplencia_controller.g.dart';

@Injectable()
class ProcessosInadimplenciaController = _ProcessosInadimplenciaControllerBase
    with _$ProcessosInadimplenciaController;

abstract class _ProcessosInadimplenciaControllerBase with Store {
  final _getProcessosInadimplenciasUnidade =
      getIt.get<GetInadimplenciasAdmProcessosUseCase>();

  @observable
  ResourceData<List<ProcessoInadimplenciasEntity>>
      processosInadimplenciasUnidade = ResourceData(status: Status.loading);

  init(int codOrd) async {
    await getProcessosInadimplenciasUnidade(codOrd);
  }

  @action
  getProcessosInadimplenciasUnidade(int codOrd) async {
    processosInadimplenciasUnidade =
        await _getProcessosInadimplenciasUnidade(codOrd);
    print(processosInadimplenciasUnidade);
  }
}

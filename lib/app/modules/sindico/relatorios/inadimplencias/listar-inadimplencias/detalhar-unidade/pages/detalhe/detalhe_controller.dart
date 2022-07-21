import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_adm_detalhe_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_detalhe_entity.dart';
part 'detalhe_controller.g.dart';

@Injectable()
class DetalheController = _DetalheControllerBase with _$DetalheController;

abstract class _DetalheControllerBase with Store {
  final _getInadimplenciasUnidade =
      getIt.get<GetInadimplenciasAdmUseDetalheUseCase>();

  @observable
  ResourceData<List<InadimplenciaAdmDetalheEntity>> inadimplenciasUnidade =
      ResourceData(status: Status.loading);

  init(SendParamsRelInadimplenciaEntity params) async {
    await getInadimplenciasUnidade(params);
  }

  @action
  getInadimplenciasUnidade(SendParamsRelInadimplenciaEntity params) async {
    inadimplenciasUnidade = await _getInadimplenciasUnidade(params);
  }
}

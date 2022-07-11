import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/taxa/get_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_adm_detalhe_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_condominio_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_detalhe_entity.dart';

part 'detalhar_unidade_controller.g.dart';

@Injectable()
class DetalharUnidadeController = _DetalharUnidadeControllerBase
    with _$DetalharUnidadeController;

abstract class _DetalharUnidadeControllerBase with Store {
  final _getInadimplenciasUnidade =
      getIt.get<GetInadimplenciasAdmUseDetalheUseCase>();
  ResourceData<List<InadimplenciaAdmDetalheEntity>> inadimplenciasUnidade;

  init(SendParamsRelInadimplenciaEntity params) async {
    await getInadimplenciasUnidade(params);
    print('filtros');
  }

  @action
  getInadimplenciasUnidade(SendParamsRelInadimplenciaEntity params) async {
    inadimplenciasUnidade = await _getInadimplenciasUnidade(params);
    print(inadimplenciasUnidade);
  }
}

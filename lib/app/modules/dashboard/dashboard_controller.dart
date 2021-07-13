import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_adm_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dashboard_controller.g.dart';

@Injectable()
class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final sharedPreferences = getIt.get<SharedPreferencesManager>();
  final _getCondominios = getIt.get<GetCondominioPorCpfUseCase>();
  final _getCondominioAtivo = getIt.get<GetCondominioAtivoUseCase>();
  final _getUnidadesAtivas = getIt.get<GetUnidadesAdmUseCase>();

  @observable
  ResourceData<List<CondominioEntity>> condominios;

  @observable
  ResourceData<UnidadeAtivaEntity> condominiosAtivos;

  @observable
  ResourceData<List<UnidadeEntity>> unidadesAtivasAdm;

  @observable
  int statusCondominio;

  @observable
  bool existeCondominiosAtivos;

  init() {
    condominios = ResourceData(status: Status.loading);
    condominiosAtivos = ResourceData(status: Status.loading);
    unidadesAtivasAdm = ResourceData(status: Status.loading);
    getInforCondominios();
  }

  testsUseCases() async {
    // var result = await _getUnidadesAtivas();

    // print("Result unidades adm ***: \n ${result.data.toString()}");
  }

  @action
  void mudarStatusCondominio(value) => statusCondominio = value;

  @action
  void checkCondominiosAtivos(value) => existeCondominiosAtivos = value;

  @action
  getInforCondominios() async {
    condominios = await _getCondominios();
    condominiosAtivos = await _getCondominioAtivo();
    unidadesAtivasAdm = await _getUnidadesAtivas();

    checkCondominiosAtivos(condominiosAtivos.data != null ? true : false);
    verificarStatusCondominios();
  }

  @computed
  bool get statusLoading =>
      condominiosAtivos.status == Status.loading &&
      unidadesAtivasAdm.status == Status.loading;

  @computed
  bool get isSindico =>
      unidadesAtivasAdm.data != null && unidadesAtivasAdm.data.length > 0;

  /*
    status 0 = nenhum condominio vinculado
    status 1 = condominio vinculado, porem nao foi ativado
    status 3 = condominios Ativos!
  */

  Future<void> verificarStatusCondominios() {
    if (condominios.data == null && condominiosAtivos.data == null)
      mudarStatusCondominio(0);
    else if (condominios.data != null)
      mudarStatusCondominio(1);
    else if (condominiosAtivos.data != null) mudarStatusCondominio(2);
  }

  Future<void> voltar() async {
    print(await sharedPreferences.get(SharedPreferencesManager.token));
    sharedPreferences.removeAll();

    print(await sharedPreferences.get(SharedPreferencesManager.token));
  }
}

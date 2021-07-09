import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/condominio_ativo_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
import 'package:Gestart/domain/usecases/feed/get_informacoes_use_case.dart';
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
  // final _getInfor = getIt.get<GetInformacoesUseCase>();

  @observable
  ResourceData<List<CondominioEntity>> condominios;

  @observable
  ResourceData<CondominioAtivoEntity> condominiosAtivos;

  @observable
  int statusCondominio;

  @observable
  bool existeCondominiosAtivos;

  init() {
    condominios = ResourceData(status: Status.loading);
    condominiosAtivos = ResourceData(status: Status.loading);
    getInforCondominios();
  }

  testsUseCases() async {
    // var result = await _getInfor();

    // print("Result Infor ***: \n ${result.data.toString()}");
  }

  /*
  TIPOS DE CLIENTE:
  0 = sem condominios vinculados
  1 = condominios vinculados
  2 = condominios ativos
  */
  @action
  void mudarStatusCondominio(value) => statusCondominio = value;

  @action
  void checkCondominiosAtivos(value) => existeCondominiosAtivos = value;

  @action
  getInforCondominios() async {
    // condominios = ResourceData(status: Status.loading);
    condominios = await _getCondominios();
    condominiosAtivos = await _getCondominioAtivo();

    checkCondominiosAtivos(condominiosAtivos.data != null ? true : false);
    verificarStatusCondominios();
  }

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

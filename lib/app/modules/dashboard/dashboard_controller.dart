import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
import 'package:Gestart/domain/usecases/reserva/criar_espaco_use_case.dart';
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
  // final _criarEspaco = getIt.get<CriarEspacoUseCase>();

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
    // var result = await _criarEspaco(EspacoEntity(
    //     codcon: 12089,
    //     antMax: 1,
    //     antMin: 1,
    //     apenasMaster: false,
    //     aprovacao: false,
    //     capacidade: 5,
    //     descricao: 'TEste aaaaaa',
    //     dom: true,
    //     domIni: 1,
    //     domFim: 1,
    //     seg: true,
    //     segIni: 1,
    //     segFim: 1,
    //     ter: true,
    //     terIni: 1,
    //     terFim: 1,
    //     qua: true,
    //     quaIni: 1,
    //     quaFim: 1,
    //     qui: true,
    //     quiIni: 1,
    //     quiFim: 1,
    //     sex: true,
    //     sexIni: 1,
    //     sexFim: 1,
    //     sab: true,
    //     sabIni: 1,
    //     sabFim: 1,
    //     obs: 'obs app',
    //     perMin: 5,
    //     perMax: 5));

    // print("Result espaco ***: \n ${result.data.toString()}");
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

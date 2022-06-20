import 'dart:io';

import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/condominio/unidades_ativa_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/entities/setup/setup_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
import 'package:Gestart/domain/usecases/setup/get_setup_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_adm_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';

part 'dashboard_controller.g.dart';

// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

@Injectable()
class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final sharedPreferences = getIt.get<SharedPreferencesManager>();
  final _getCondominios = getIt.get<GetCondominioPorCpfUseCase>();
  final _getCondominioAtivo = getIt.get<GetCondominioAtivoUseCase>();
  final _getUnidadesAtivas = getIt.get<GetUnidadesAdmUseCase>();
  final _getSetup = getIt.get<GetSetupUseCase>();

  @observable
  bool isVisible = false;

  @observable
  String versionInfo = '';

  @observable
  String storeVersion = '';

  @observable
  ResourceData<List<CondominioEntity>> condominios;

  @observable
  ResourceData<List<UnidadeAtivaEntity>> condominiosAtivos;

  @observable
  ResourceData<List<UnidadeEntity>> unidadesAtivasAdm;

  @observable
  int statusCondominio = 0;

  @observable
  bool existeCondominiosAtivos;

  @observable
  int servicoReservaDisponivel;

  @observable
  bool servicoReserva;

  @observable
  bool chekedSindico = false;

  @observable
  ResourceData<SetupEntity> setup;

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

  Future<dynamic> checkStorageVersionDiff() async {
    setup = await _getSetup();

    int forceUpdate = setup.data.forceUpdate;
    bool isAndroid = Platform.isAndroid ? true : false;

    bool isForceUpdate = forceUpdate == 1 ? true : false;

    String deviceVersion =
        await sharedPreferences.getString('version').then((value) => value);

    storeVersion = isAndroid
        ? setup.data.androidStoreVersion.trim()
        : setup.data.iosStoreVersion.trim();

    if (isAndroid && deviceVersion == setup.data.androidStoreVersion.trim()) {
      isVisible = false;
    } else if (!isAndroid &&
        deviceVersion == setup.data.iosStoreVersion.trim()) {
      isVisible = false;
    } else
      isVisible = true;

    return new Future<dynamic>(() {
      return {
        'isVisible': isVisible,
        'storeVersion': storeVersion,
        'deviceVersion': deviceVersion,
        'forceUpdate': isForceUpdate
      };
    });
  }

  @action
  void mudarStatusCondominio(value) => statusCondominio = value;

  @action
  void checkCondominiosAtivos(value) => existeCondominiosAtivos = value;

  @action
  void checkServicoReservasActive() {
    condominiosAtivos.data.map((e) => e.gestartappReserva == 1
        ? servicoReservaDisponivel = 1
        : servicoReservaDisponivel);
  }

  @action
  getInforCondominios() async {
    chekedSindico = false;
    condominios = await _getCondominios();
    condominiosAtivos = await _getCondominioAtivo();
    unidadesAtivasAdm = await _getUnidadesAtivas();
    checkCondominiosAtivos(condominiosAtivos.data != null ? true : false);
    checkServicoReservasActive();

    verificarStatusCondominios();
    chekedSindico = true;
    ResourceData<SetupEntity> setup = await _getSetup();

    sharedPreferences.putInt('versaoArquivos', setup.data.versaoArquivos);
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

  verificarStatusCondominios() {
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

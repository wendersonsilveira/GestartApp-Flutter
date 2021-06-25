import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_ativo_use_case.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
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

  @observable
  ResourceData<CondominioEntity> condominios;
  ResourceData<CondominioEntity> condominiosAtivos;

  init() {
    // getAllCategories();
    // checkSolicitations();
  }

  testsUseCases() async {
    var result = await _getCondominioAtivo();

    print("Result Check: \n ${result.data.toString()}");
  }

  @action
  getCondominioPorCpf() async {
    condominios = ResourceData(status: Status.loading);
    condominios = await _getCondominios();
  }

  @action
  getCondominiosAtivos() async {
    condominios = ResourceData(status: Status.loading);
    condominios = await _getCondominios();
  }

  Future<void> voltar() async {
    print(await sharedPreferences.get(SharedPreferencesManager.token));
    sharedPreferences.removeAll();

    print(await sharedPreferences.get(SharedPreferencesManager.token));
  }
}

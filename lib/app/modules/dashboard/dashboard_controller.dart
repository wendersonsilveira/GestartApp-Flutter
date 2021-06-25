import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/usecases/condominio/get_condominio_por_cpf_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dashboard_controller.g.dart';

@Injectable()
class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final sharedPreferences = getIt.get<SharedPreferencesManager>();
  final _getCondominio = getIt.get<GetCondominioPorCpfUseCase>();

  testsUseCases() async {
    var result = await _getCondominio();

    print("Result Check: \n ${result.data.toString()}");
  }

  Future<void> voltar() async {
    print(await sharedPreferences.get(SharedPreferencesManager.token));
    sharedPreferences.removeAll();

    print(await sharedPreferences.get(SharedPreferencesManager.token));
  }
}

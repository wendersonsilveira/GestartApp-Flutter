import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'constants/route_name.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final sharedPreferences = getIt.get<SharedPreferencesManager>();

  @observable
  bool loading = true;

  String initRouter = '/';

  @action
  Future<void> isUserLogged() async {
    loading = true;
    String token = await sharedPreferences.get(SharedPreferencesManager.token);
    if (token != null && token.isNotEmpty) initRouter = RouteName.dashboard;
    loading = false;
  }
}

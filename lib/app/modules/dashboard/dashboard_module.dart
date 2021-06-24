import 'package:Gestart/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => DashboardPage()),
      ];

  static Inject get to => Inject<DashboardModule>.of();
}

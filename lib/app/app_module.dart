import 'package:Gestart/app/modules/dashboard/dashboard_page.dart';

import 'constants/route_name.dart';
import 'modules/dashboard/dashboard_controller.dart';
import 'package:Gestart/app/modules/login/login_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $DashboardController,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter(RouteName.dashboard, child: (_, args) => DashboardPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

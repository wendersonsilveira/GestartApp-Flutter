import 'condominio_controller.dart';
import 'package:Gestart/app/constants/route_name.dart';

import 'ativar_condominio/ativar_condominio_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ativar_condominio/ativar_condominio_page.dart';
import 'condominio_page.dart';

class CondominioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CondominioController,
        $AtivarCondominioController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CondominioPage()),
        ModularRouter(RouteName.ativar_condominio,
            child: (_, args) => AtivarCondominioPage()),
      ];

  static Inject get to => Inject<CondominioModule>.of();
}

import 'package:Gestart/app/modules/veiculo/veiculos_page.dart';

import 'veiculos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VeiculosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $VeiculosController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => VeiculosPage()),
      ];

  static Inject get to => Inject<VeiculosModule>.of();
}

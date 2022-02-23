import 'package:Gestart/app/modules/veiculo/veiculos_page.dart';

import 'veiculos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VeiculosModule extends Module {
  @override
  List<Bind> get binds => [
        $VeiculosController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => VeiculosPage()),
      ];

  //static Inject get to => Inject<VeiculosModule>.of();
}

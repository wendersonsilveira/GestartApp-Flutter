import 'package:Gestart/app/modules/assembleia/assembleia_page.dart';

import 'assembleia_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AssembleiaModule extends Module {
  @override
  List<Bind> get binds => [
        $AssembleiaController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => AssembleiaPage()),
      ];

  // //static Inject get to => Inject<AssembleiaModule>.of();
}

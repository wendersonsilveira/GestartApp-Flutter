import 'package:Gestart/app/modules/cadastros/cadastros_page.dart';

import 'cadastros_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastrosModule extends Module {
  @override
  List<Bind> get binds => [
        $CadastrosController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => CadastrosPage()),
      ];

  //static Inject get to => Inject<CadastrosModule>.of();
}

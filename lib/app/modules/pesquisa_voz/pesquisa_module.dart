import 'package:Gestart/app/modules/pesquisa_voz/pesquisa_page.dart';

import 'pesquisa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PesquisaModule extends Module {
  @override
  List<Bind> get binds => [
        $PesquisaController,
      ];

  @override
  List<ModularRoute> get routers => [
        ChildRoute(Modular.initialRoute, child: (_, args) => PesquisaPage()),
      ];

  //static Inject get to => Inject<PesquisaModule>.of();
}

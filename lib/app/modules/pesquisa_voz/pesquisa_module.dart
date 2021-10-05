import 'package:Gestart/app/modules/pesquisa_voz/pesquisa_page.dart';

import 'pesquisa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PesquisaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PesquisaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PesquisaPage()),
      ];

  static Inject get to => Inject<PesquisaModule>.of();
}

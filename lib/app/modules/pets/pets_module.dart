import 'package:Gestart/app/modules/pets/pets_page.dart';

import 'pets_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PetsModule extends Module {
  @override
  List<Bind> get binds => [
        $PetsController,
      ];

  @override
  List<ModularRoute> get routers => [
        ChildRoute(Modular.initialRoute, child: (_, args) => PetsPage()),
      ];

  //static Inject get to => Inject<PetsModule>.of();
}

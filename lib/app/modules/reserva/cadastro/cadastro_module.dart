import 'cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CadastroController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<CadastroModule>.of();
}

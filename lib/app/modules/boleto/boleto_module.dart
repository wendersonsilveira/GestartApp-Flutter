import 'boleto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BoletoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $BoletoController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<BoletoModule>.of();
}

import 'boleto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BoletoModule extends Module {
  @override
  List<Bind> get binds => [
        $BoletoController,
      ];

  @override
  List<ModularRoute> get routes => [];

  ////static Inject get to => Inject<BoletoModule>.of();
}

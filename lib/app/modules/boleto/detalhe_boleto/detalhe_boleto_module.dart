import 'detalhe_boleto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetalheBoletoModule extends Module {
  @override
  List<Bind> get binds => [
        $DetalheBoletoController,
      ];

  @override
  List<ModularRoute> get routers => [];

  //static Inject get to => Inject<DetalheBoletoModule>.of();
}

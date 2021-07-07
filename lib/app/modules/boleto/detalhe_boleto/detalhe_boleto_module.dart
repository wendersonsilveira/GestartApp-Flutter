import 'detalhe_boleto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetalheBoletoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DetalheBoletoController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<DetalheBoletoModule>.of();
}

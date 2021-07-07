import 'reserva_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReservaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ReservaController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<ReservaModule>.of();
}

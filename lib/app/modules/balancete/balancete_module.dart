import 'balancete_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BalanceteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $BalanceteController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<BalanceteModule>.of();
}

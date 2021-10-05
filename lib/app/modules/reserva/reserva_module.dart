import 'dados_reserva/dados_reserva_controller.dart';
import 'espacos/espacos_controller.dart';
import 'horarios/horarios_controller.dart';
import 'unidades/unidades_controller.dart';
import 'reserva_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReservaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DadosReservaController,
        $EspacosController,
        $HorariosController,
        $UnidadesController,
        $ReservaController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<ReservaModule>.of();
}

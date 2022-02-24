import 'documentos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DocumentosModule extends Module {
  @override
  List<Bind> get binds => [
        $DocumentosController,
      ];

  @override
  List<ModularRoute> get routes => [];

  //static Inject get to => Inject<DocumentosModule>.of();
}

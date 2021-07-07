import 'documentos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DocumentosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DocumentosController,
      ];

  @override
  List<ModularRouter> get routers => [];

  static Inject get to => Inject<DocumentosModule>.of();
}

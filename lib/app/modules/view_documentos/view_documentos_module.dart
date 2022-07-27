import 'package:Gestart/app/modules/view_documentos/view_documentos_controller.dart';
import 'package:Gestart/app/modules/view_documentos/view_documentos_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ViewDocumentosModule extends Module {
  @override
  List<Bind> get binds => [$ViewDocumentosController];

  @override
  List<ModularRoute> get routers => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => ViewDocumentosPage()),
      ];

  //static Inject get to => Inject<ViewDocumentosModule>.of();
}

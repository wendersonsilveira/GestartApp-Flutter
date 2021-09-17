import 'ativar_condominio/gerar_codigo/gerar_codigo_controller.dart';
import 'ativar_condominio/codigo_ativacao/codigo_ativacao_controller.dart';
import 'ativar_condominio/condominio_online/condominio_online_controller.dart';
import 'infor_condominio/infor_condominio_controller.dart';
import 'condominio_controller.dart';
import 'package:Gestart/app/constants/route_name.dart';

import 'ativar_condominio/ativar_condominio_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ativar_condominio/ativar_condominio_page.dart';
import 'condominio_page.dart';

class CondominioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $GerarCodigoController,
        $CodigoAtivacaoController,
        $CondominioOnlineController,
        $InforCondominioController,
        $CondominioController,
        $AtivarCondominioController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CondominioPage()),
        ModularRouter(RouteName.ativar_condominio,
            child: (_, args) => AtivarCondominioPage()),
      ];

  static Inject get to => Inject<CondominioModule>.of();
}

import 'modules/sindico/financeiro/contas_fixas/contas_fixas_controller.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/detalhes_reserva/detalhes_reserva_controller.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/detalhes_reserva/detalhes_reserva_page.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/calendario/calendario_controller.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/reservas_pendentes/reservas_pendentes_controller.dart';
import 'package:Gestart/app/modules/sindico/reserva_espaco/gerenciar_reserva/gerenciar_reserva_page.dart';

import 'modules/sindico/reserva_espaco/gerenciar_reserva/gerenciar_reserva_controller.dart';
import 'modules/sindico/reserva_espaco/listar_espacos/listar_espacos_controller.dart';
import 'package:Gestart/app/modules/pesquisa_voz/pesquisa_controller.dart';
import 'package:Gestart/app/modules/pesquisa_voz/pesquisa_page.dart';
import 'package:Gestart/app/modules/sindico/reserva_espaco/cadastro_espaco/cadastro_espaco_page.dart';
import 'package:Gestart/app/modules/sindico/controle_recebimentos/recebimentos_page.dart';
import 'package:Gestart/app/modules/veiculo/cadastro_veiculo/cadastro_veiculo_controller.dart';
import 'package:Gestart/app/modules/veiculo/veiculos_controller.dart';
import 'package:Gestart/app/modules/veiculo/veiculos_page.dart';

import 'modules/sindico/reserva_espaco/cadastro_espaco/cadastro_espaco_controller.dart';
import 'package:Gestart/app/modules/sindico/sindico_page.dart';

import 'modules/sindico/sindico_controller.dart';
import 'package:Gestart/app/modules/perfil/alterar_perfil/alterar_perfil_page.dart';

import 'modules/perfil/alterar_perfil/alterar_perfil_controller.dart';
import 'modules/perfil/perfil_controller.dart';
import 'modules/notificacoes/notificacoes_controller.dart';
import 'package:Gestart/app/modules/informativos/informativo/informativo_page.dart';

import 'modules/informativos/informativo/informativo_controller.dart';
import 'modules/informativos/informativos_controller.dart';
import 'package:Gestart/app/modules/boleto/boleto_controller.dart';
import 'package:Gestart/app/modules/boleto/boleto_page.dart';
import 'package:Gestart/app/modules/boleto/detalhe_boleto/detalhe_boleto_controller.dart';
import 'package:Gestart/app/modules/boleto/detalhe_boleto/detalhe_boleto_page.dart';
import 'package:Gestart/app/modules/balancete/balancete_controller.dart';
import 'package:Gestart/app/modules/balancete/balancete_page.dart';

import 'package:Gestart/app/modules/condominio/infor_condominio/infor_condominio_controller.dart';
import 'package:Gestart/app/modules/condominio/infor_condominio/infor_condominio_page.dart';
import 'package:Gestart/app/modules/documentos/documentos_controller.dart';
import 'package:Gestart/app/modules/home/home_controller.dart';
import 'package:Gestart/app/modules/home/home_page.dart';

import 'package:Gestart/app/modules/reserva/cadastro/cadastro_controller.dart'
    as cadastroReservaController;
import 'package:Gestart/app/modules/reserva/dados_reserva/dados_reserva_controller.dart';
import 'package:Gestart/app/modules/reserva/dados_reserva/dados_reserva_page.dart';

import 'package:Gestart/app/modules/reserva/espacos/espacos_controller.dart';
import 'package:Gestart/app/modules/reserva/espacos/espacos_page.dart';
import 'package:Gestart/app/modules/reserva/horarios/horarios_controller.dart';
import 'package:Gestart/app/modules/reserva/horarios/horarios_page.dart';
import 'package:Gestart/app/modules/reserva/unidades/unidades_controller.dart';

import 'package:Gestart/app/modules/view_documentos/view_documentos_page.dart';
import 'modules/documentos/documentos_page.dart';

import 'modules/reserva/cadastro/cadastro_page.dart' as cadastroReserva;
import 'modules/reserva/reserva_controller.dart';
import 'modules/reserva/reserva_page.dart';
import 'modules/reserva/unidades/unidades_page.dart';
import 'modules/veiculo/cadastro_veiculo/cadastro_veiculo_page.dart';
import 'modules/view_documentos/view_documentos_controller.dart';
import 'package:Gestart/app/modules/assembleia/assembleia_controller.dart';
import 'package:Gestart/app/modules/assembleia/assembleia_page.dart';
import 'package:Gestart/app/modules/assembleia/detalhes_assembleia/detalhes_assembleia_page.dart';
import 'package:Gestart/app/modules/cadastros/cadastros_controller.dart';
import 'package:Gestart/app/modules/cadastros/cadastros_page.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/ativar_condominio_controller.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/ativar_condominio_page.dart';
import 'package:Gestart/app/modules/dashboard/dashboard_page.dart';
import 'package:Gestart/app/modules/pets/pets_controller.dart';
import 'package:Gestart/app/modules/assembleia/detalhes_assembleia/detalhes_assembleia_controller.dart';
import 'package:Gestart/app/modules/pets/pets_page.dart';
import 'package:Gestart/app/modules/pets/cadastro_pet/cadastro_pet_page.dart';
import 'package:Gestart/app/modules/pets/cadastro_pet/cadastro_pet_controller.dart';
import 'package:Gestart/app/modules/reserva/reserva_controller.dart';
import 'package:Gestart/app/modules/veiculo/veiculos_controller.dart';
import 'package:Gestart/app/modules/sindico/reserva_espaco/listar_espacos/listar_espacos_page.dart';
import 'package:Gestart/app/modules/sindico/financeiro/contas_fixas/contas_fixas_page.dart';

import 'constants/route_name.dart';
import 'modules/condominio/condominio_controller.dart';
import 'modules/condominio/condominio_page.dart';
import 'modules/dashboard/dashboard_controller.dart';
import 'package:Gestart/app/modules/login/login_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $ContasFixasController,
        $DetalhesReservaController,
        $CalendarioController,
        $ReservasPendentesController,
        $GerenciarReservaController,
        $ListarEspacosController,
        $CadastroEspacoController,
        $SindicoController,
        $AlterarPerfilController,
        $PerfilController,
        $NotificacoesController,
        $InformativoController,
        $InformativoController,
        $InformativosController,
        $ViewDocumentosController,
        $DashboardController,
        $AppController,
        $CondominioController,
        $AtivarCondominioController,
        $CadastrosController,
        $PetsController,
        $AssembleiaController,
        $DetalhesAssembleiaController,
        $CadastroPetController,
        $BoletoController,
        $DetalheBoletoController,
        $BalanceteController,
        $DocumentosController,
        $InforCondominioController,
        $HomeController,
        $InformativosController,
        $InformativoController,
        $ReservaController,
        $UnidadesController,
        $EspacosController,
        $HorariosController,
        cadastroReservaController.$CadastroController,
        $DadosReservaController,
        $VeiculosController,
        $CadastroVeiculoController,
        $PesquisaController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter(RouteName.condominio,
            child: (_, args) => CondominioPage()),
        ModularRouter(RouteName.dashboard, child: (_, args) => DashboardPage()),
        ModularRouter(RouteName.ativar_condominio,
            child: (_, args) => AtivarCondominioPage()),
        ModularRouter(RouteName.cadastros, child: (_, args) => CadastrosPage()),
        ModularRouter(RouteName.pets, child: (_, args) => PetsPage()),
        ModularRouter(RouteName.assembleia,
            child: (_, args) => AssembleiaPage()),
        ModularRouter(RouteName.detalhes_assembleia,
            child: (_, args) => DetalhesAssembleiaPage(id: args.data)),
        ModularRouter(RouteName.view_documento,
            child: (_, args) => ViewDocumentosPage(
                  url: args.data[0],
                  title: args.data[1],
                )),
        ModularRouter(RouteName.cadastro_pet,
            child: (_, args) => CadastroPetPage(id: args.data)),
        ModularRouter(RouteName.boleto, child: (_, args) => BoletoPage()),
        ModularRouter(RouteName.detalhe_boleto,
            child: (_, args) => DetalheBoletoPage(codord: args.data)),
        ModularRouter(RouteName.balancetes,
            child: (_, args) => BalancetePage()),
        ModularRouter(RouteName.infor_condominio,
            child: (_, args) => InforCondominioPage()),
        ModularRouter(RouteName.documentos,
            child: (_, args) => DocumentosPage()),
        ModularRouter(RouteName.home, child: (_, args) => HomePage()),
        ModularRouter(RouteName.informativo,
            child: (_, args) => InformativoPage(id: args.data)),
        ModularRouter(RouteName.alterar_perfil,
            child: (_, args) => AlterarPerfilPage(usuario: args.data)),
        ModularRouter(RouteName.painel_sindico,
            child: (_, args) => SindicoPage()),
        ModularRouter(RouteName.cadastro_espaco,
            child: (_, args) => CadastroEspacoPage(id: args.data)),
        ModularRouter(RouteName.detalhe_boleto,
            child: (_, args) => DetalheBoletoPage(codord: args.data)),
        ModularRouter(RouteName.balancetes,
            child: (_, args) => BalancetePage()),
        ModularRouter(RouteName.reservas, child: (_, args) => ReservaPage()),
        ModularRouter(RouteName.reservaUnidades,
            child: (_, args) => UnidadesPage()),
        ModularRouter(RouteName.reservaEspacos,
            child: (_, args) =>
                EspacosPage(codcon: args.data[0], codord: args.data[1])),
        ModularRouter(RouteName.reservaHorarios,
            child: (_, args) =>
                HorariosPage(espacoId: args.data[0], codord: args.data[1])),
        ModularRouter(RouteName.reservaCadastro,
            child: (_, args) =>
                cadastroReserva.CadastroPage(reserva: args.data)),
        ModularRouter(RouteName.reservaDados,
            child: (_, args) => DadosReservaPage(reserva: args.data)),
        ModularRouter(RouteName.veiculos, child: (_, args) => VeiculosPage()),
        ModularRouter(RouteName.cadastroVeiculo,
            child: (_, args) => CadastroVeiculoPage(id: args.data)),
        ModularRouter(RouteName.listar_espacos,
            child: (_, args) => ListarEspacosPage()),
        ModularRouter(RouteName.pesquisaVoz,
            child: (_, args) => PesquisaPage()),
        ModularRouter(RouteName.recebimentos,
            child: (_, args) => RecebimentosPage()),
        ModularRouter(RouteName.gerenciar_reserva,
            child: (_, args) => GerenciarReservaPage()),
        ModularRouter(RouteName.detalhes_reserva,
            child: (_, args) => DetalhesReservaPage(reserva: args.data)),
        ModularRouter(RouteName.contas_fixas,
            child: (_, args) => ContasFixasPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

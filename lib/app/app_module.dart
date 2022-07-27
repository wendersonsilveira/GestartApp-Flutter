import 'package:Gestart/app/modules/informativos/informativos_page.dart';

import 'modules/error/erro/erro_controller.dart';
import 'package:Gestart/app/modules/balancete/detalhe_balancete/detalhe_balancete_controller.dart';
import 'package:Gestart/app/modules/balancete/detalhe_balancete/detalhe_balancete_page.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/codigo_ativacao/codigo_ativacao_controller.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/codigo_ativacao/codigo_ativacao_page.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/condominio_online/condominio_online_controller.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/condominio_online/condominio_online_page.dart';
import 'package:Gestart/app/modules/condominio/ativar_condominio/enviar_codigo/enviar_codigo_controller.dart';

import 'modules/error/erro/erro_page.dart';
import 'modules/sindico/cadastros/cadastros_controller.dart'
    as cadastroSindicoController;
import 'package:Gestart/app/modules/sindico/financeiro/movimento_financeiro/detalhe_movimento/detalhe_movimento_page.dart';

import 'modules/sindico/financeiro/movimento_financeiro/detalhe_movimento/detalhe_movimento_controller.dart';
import 'package:Gestart/app/modules/sindico/financeiro/movimento_financeiro/movimento_financeiro_page.dart';

import 'modules/sindico/financeiro/movimento_financeiro/movimento_financeiro_controller.dart';
import 'modules/sindico/comunicacao/avisos/avisos_page_controller.dart';
import 'modules/sindico/comunicacao/avisos/cadastro/cadastro_aviso_page_controller.dart';
import 'modules/sindico/financeiro/contas_fixas/contas_fixas_controller.dart';
import 'modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/pages/detalhe/detalhe_controller.dart';
import 'modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/pages/historico/historico_inadimplencia_controller.dart';
import 'modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/pages/incidencias/incidencias_inadimplencia_controller.dart';
import 'modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/pages/processos/processos_inadimplencia_controller.dart';
import 'modules/sindico/relatorios/reservas/lista-reservas/lista_reservas_controller.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/detalhes_reserva/detalhes_reserva_controller.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/detalhes_reserva/detalhes_reserva_page.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/calendario/calendario_controller.dart';
import 'modules/sindico/reserva_espaco/gerenciar_reserva/reservas_pendentes/reservas_pendentes_controller.dart';
import 'package:Gestart/app/modules/sindico/reserva_espaco/gerenciar_reserva/gerenciar_reserva_page.dart';

import 'modules/sindico/reserva_espaco/gerenciar_reserva/gerenciar_reserva_controller.dart';
import 'modules/sindico/reserva_espaco/listar_espacos/listar_espacos_controller.dart';
import 'package:Gestart/app/modules/pesquisa_voz/pesquisa_controller.dart';
import 'package:Gestart/app/modules/pesquisa_voz/pesquisa_page.dart';
import 'package:Gestart/app/modules/sindico/controle_recebimentos/recebimento/recebimentos_page.dart';
import 'package:Gestart/app/modules/sindico/reserva_espaco/cadastro_espaco/cadastro_espaco_page.dart';
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
import 'package:Gestart/app/modules/sindico/relatorios/reservas/relatorio_reservas_controller.dart';
import 'package:Gestart/app/modules/sindico/reserva_espaco/listar_espacos/listar_espacos_page.dart';
import 'package:Gestart/app/modules/sindico/financeiro/contas_fixas/contas_fixas_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/reservas/relatorio_reservas_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/reservas/lista-reservas/lista_reservas_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/relatorio_inadimplencia_controller.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/relatorio_inadimplencia_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/listar_inadimplencias_controller.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/listar_inadimplencias_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/detalhar_unidade_controller.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/detalhar_unidade_page.dart';

import 'constants/route_name.dart';
import 'modules/condominio/condominio_controller.dart';
import 'modules/condominio/condominio_page.dart';
import 'modules/dashboard/dashboard_controller.dart';
import 'package:Gestart/app/modules/login/login_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/app/app_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $ErroController,
        cadastroSindicoController.$CadastrosController,
        $DetalheMovimentoController,
        $MovimentoFinanceiroController,
        $CadastroAvisoPageController,
        $AvisosPageController,
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
        $PesquisaController,
        $CondominioOnlineController,
        $CodigoAtivacaoController,
        $EnviarCodigoController,
        $DetalheBalanceteController,
        $RelatorioReservasController,
        $RelatorioInadimplenciaController,
        $ListaReservasController,
        $ErroController,
        $InformativosController,
        $ListaInadimplenciasController,
        $DetalharUnidadeController,
        $DetalheController,
        $HistoricoInadimplenciaController,
        $ProcessosInadimplenciaController,
        $IncidenciasInadimplenciaController
      ];

  @override
  List<ModularRoute> get routes => [
        // ModuleRoute(Modular.initialRoute, module:  LoginModule()),
        ChildRoute(RouteName.condominio, child: (_, args) => CondominioPage()),
        ChildRoute(RouteName.dashboard, child: (_, args) => DashboardPage()),
        ChildRoute(RouteName.ativar_condominio,
            child: (_, args) => AtivarCondominioPage()),
        ChildRoute(RouteName.cadastros, child: (_, args) => CadastrosPage()),
        ChildRoute(RouteName.pets, child: (_, args) => PetsPage()),
        ChildRoute(RouteName.assembleia, child: (_, args) => AssembleiaPage()),
        ChildRoute(RouteName.detalhes_assembleia,
            child: (_, args) => DetalhesAssembleiaPage(id: args.data)),
        ChildRoute(RouteName.view_documento,
            child: (_, args) => ViewDocumentosPage(
                  url: args.data[0],
                  title: args.data[1],
                )),
        ChildRoute(RouteName.cadastro_pet,
            child: (_, args) => CadastroPetPage(id: args.data)),
        ChildRoute(RouteName.boleto, child: (_, args) => BoletoPage()),
        ChildRoute(RouteName.detalhe_boleto,
            child: (_, args) => DetalheBoletoPage(idBoleto: args.data)),
        ChildRoute(RouteName.balancetes, child: (_, args) => BalancetePage()),
        ChildRoute(RouteName.infor_condominio,
            child: (_, args) => InforCondominioPage()),
        ChildRoute(RouteName.documentos, child: (_, args) => DocumentosPage()),
        ChildRoute(RouteName.home, child: (_, args) => HomePage()),
        ChildRoute(RouteName.informativo,
            child: (_, args) => InformativoPage(id: args.data)),
        ChildRoute(RouteName.alterar_perfil,
            child: (_, args) => AlterarPerfilPage(usuario: args.data)),
        ChildRoute(RouteName.painel_sindico, child: (_, args) => SindicoPage()),
        ChildRoute(RouteName.cadastro_espaco,
            child: (_, args) => CadastroEspacoPage(id: args.data)),
        ChildRoute(RouteName.balancetes, child: (_, args) => BalancetePage()),
        ChildRoute(RouteName.reservas, child: (_, args) => ReservaPage()),
        ChildRoute(RouteName.reservaUnidades,
            child: (_, args) => UnidadesPage()),
        ChildRoute(RouteName.reservaEspacos,
            child: (_, args) =>
                EspacosPage(codcon: args.data[0], codord: args.data[1])),
        ChildRoute(RouteName.reservaHorarios,
            child: (_, args) =>
                HorariosPage(espacoId: args.data[0], codord: args.data[1])),
        ChildRoute(RouteName.reservaCadastro,
            child: (_, args) =>
                cadastroReserva.CadastroPage(reserva: args.data)),
        ChildRoute(RouteName.reservaDados,
            child: (_, args) => DadosReservaPage(idReserva: args.data)),
        ChildRoute(RouteName.veiculos, child: (_, args) => VeiculosPage()),
        ChildRoute(RouteName.cadastroVeiculo,
            child: (_, args) => CadastroVeiculoPage(id: args.data)),
        ChildRoute(RouteName.listar_espacos,
            child: (_, args) => ListarEspacosPage()),
        ChildRoute(RouteName.pesquisaVoz, child: (_, args) => PesquisaPage()),
        ChildRoute(RouteName.recebimentos,
            child: (_, args) => RecebimentosPage()),
        ChildRoute(RouteName.gerenciar_reserva,
            child: (_, args) => GerenciarReservaPage()),
        ChildRoute(RouteName.contas_fixas,
            child: (_, args) => ContasFixasPage()),
        ChildRoute(RouteName.movimento_financeiro,
            child: (_, args) => MovimentoFinanceiroPage()),
        ChildRoute(RouteName.movimento_financeiro_detalhe,
            child: (_, args) => DetalheMovimentoPage(
                  movimentacao: args.data,
                )),
        ChildRoute(RouteName.cadastroVeiculo,
            child: (_, args) => CadastroVeiculoPage(id: args.data)),
        ChildRoute(RouteName.listar_espacos,
            child: (_, args) => ListarEspacosPage()),
        ChildRoute(RouteName.pesquisaVoz, child: (_, args) => PesquisaPage()),
        ChildRoute(RouteName.recebimentos,
            child: (_, args) => RecebimentosPage()),
        ChildRoute(RouteName.gerenciar_reserva,
            child: (_, args) => GerenciarReservaPage()),
        ChildRoute(RouteName.detalhes_reserva,
            child: (_, args) => DetalhesReservaPage(idReserva: args.data)),
        ChildRoute(RouteName.contas_fixas,
            child: (_, args) => ContasFixasPage()),
        ChildRoute(RouteName.condominio_online_ativar,
            child: (_, args) => CondominioOnlinePage()),
        ChildRoute(RouteName.ativar_codigo_email,
            child: (_, args) => CodigoAtivacaoPage()),
        ChildRoute(RouteName.detalhe_balancete,
            child: (_, args) => DetalheBalancetePage(
                  idBalancete: args.data,
                )),
        ChildRoute(RouteName.relatorioReservas,
            child: (_, args) => RelatorioReservasPage()),
        ChildRoute(RouteName.listaReservas,
            child: (_, args) => ListaReservasPage(
                  params: args.data,
                )),
        ChildRoute(RouteName.listarInadimplencia,
            child: (_, args) => ListaInadimplenciasPage(
                  params: args.data,
                )),
        ChildRoute(RouteName.detalharInadimplenciasUnidade,
            child: (_, args) => DetalharUnidadePage(
                  params: args.data[0],
                  inadimplencia: args.data[1],
                )),
        ChildRoute(RouteName.relatorioInadimplencia,
            child: (_, args) => RelatorioInadimplenciaPage()),
        ChildRoute(RouteName.informativos_page,
            child: (_, args) => InformativosPage()),
        ChildRoute(RouteName.error_page,
            child: (_, args) => ErroPage(
                  msgErro: args.data,
                )),
      ];

  // @override
  // Widget get bootstrap => AppWidget();

  // //static Inject get to => Inject<AppModule>.of();
}

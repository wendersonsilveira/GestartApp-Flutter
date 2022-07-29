import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/pages/historico/historico_inadimplencia_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/pages/incidencias/incidencias_inadimplencia_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/detalhar-unidade/pages/processos/processos_inadimplencia_page.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhar_unidade_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';

import 'pages/detalhe/detalhe_page.dart';

class DetalharUnidadePage extends StatefulWidget {
  final String title;
  final SendParamsRelInadimplenciaEntity params;
  final InadimplenciaAdmEntity inadimplencia;
  const DetalharUnidadePage(
      {Key key,
      this.title = "Relatório de inadimplência",
      this.params,
      this.inadimplencia})
      : super(key: key);

  @override
  _DetalharUnidadePageState createState() => _DetalharUnidadePageState();
}

class _DetalharUnidadePageState
    extends ModularState<DetalharUnidadePage, DetalharUnidadeController>
    with TickerProviderStateMixin {
  bool enableButton = false;
  DateTime startDate;
  DateTime endDate;
  TabController _tabController;
  List<bool> _isDisable = [false, false, false, false];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(onTap);

    controller.init(widget.params);
    checkDisponibilidade();
  }

  checkDisponibilidade() {
    if (!widget.inadimplencia.negativadoInt) _isDisable[2] = true;
    if (!widget.inadimplencia.processadoInt) _isDisable[3] = true;
  }

  onTap() {
    if (_isDisable[_tabController.index]) {
      int index = _tabController.previousIndex;

      setState(() {
        _tabController.index = index;
      });
    }
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        controller: _tabController,
        labelStyle: TextStyle(fontSize: 13),
        tabs: [
          Tab(
            child: Text(
              'Detalhe',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Histórico',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Incidências',
              style: _isDisable[2]
                  ? TextStyle(fontSize: 11, color: Colors.black26)
                  : TextStyle(fontSize: 11),
            ),
          ),
          Tab(
            child: Text(
              'Processos',
              style: _isDisable[3]
                  ? TextStyle(fontSize: 11, color: Colors.black26)
                  : TextStyle(
                      fontSize: 11,
                    ),
            ),
          )
        ],
      );

  mudarPage(int index) {
    setState(() {
      if (index != 2) {
        print(index);
        _tabController.animateTo(index,
            duration: Duration(milliseconds: 600), curve: Curves.bounceOut);
      }
    });
    // controller.getUnidades(filtro);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBarCustom(
            context,
            title: Text(widget.title),
            bottom: _tabBar,
          ),
          body: Observer(
              builder: (_) => TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        DetalhePage(
                          params: widget.params,
                        ),
                        HistoricoInadimplenciaPage(
                          params: widget.params,
                        ),
                        IncidenciasInadimplenciaPage(
                          params: widget.params,
                        ),
                        ProcessosInadimplenciaPage(
                          codOrd: widget.params.codOrd,
                        )
                      ]))),
    );
  }
}

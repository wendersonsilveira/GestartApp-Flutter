import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhar_unidade_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';

class DetalharUnidadePage extends StatefulWidget {
  final String title;
  final SendParamsRelInadimplenciaEntity params;
  const DetalharUnidadePage(
      {Key key, this.title = "Relatório de inadimplência", this.params})
      : super(key: key);

  @override
  _DetalharUnidadePageState createState() => _DetalharUnidadePageState();
}

class _DetalharUnidadePageState
    extends ModularState<DetalharUnidadePage, DetalharUnidadeController> {
  bool enableButton = false;
  DateTime startDate;
  DateTime endDate;
  @override
  void initState() {
    super.initState();
    // controller.getAvisos();
    print(widget.params);
    controller.init(widget.params);
  }

  TabController _tabController;

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        controller: _tabController,
        tabs: [
          Tab(
            text: 'Detalhe',
          ),
          Tab(
            text: 'Histórico',
          ),
          Tab(
            text: 'Incidências',
          ),
          Tab(
            text: 'Processos',
          )
        ],
      );

  mudarPage(int index) {
    setState(() {
      _tabController.animateTo(index,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
    // controller.getUnidades(filtro);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          bottomNavigationBar: GestureDetector(
              onTap: () => {},
              child: Container(
                height: 50,
                color: AppColorScheme.primaryColor,
                child: Center(
                  child: Text(
                    "Pesquisar",
                    style: TextStyle(color: AppColorScheme.white),
                  ),
                ),
              )),
          appBar: AppBarCustom(
            context,
            title: Text(widget.title),
            bottom: _tabBar,
          ),
          body: Observer(
              builder: (_) => TabBarView(controller: _tabController, children: [
                    Text('teste1'),
                    Text('teste2'),
                    Text('teste3'),
                    Text('teste4')
                  ]))),
    );
  }
}

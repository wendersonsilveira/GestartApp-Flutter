import 'package:Gestart/app/modules/sindico/reserva_espaco/gerenciar_reserva/calendario/calendario_page.dart';
import 'package:Gestart/app/modules/sindico/reserva_espaco/gerenciar_reserva/reservas_pendentes/reservas_pendentes_page.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'gerenciar_reserva_controller.dart';

class GerenciarReservaPage extends StatefulWidget {
  final String title;
  const GerenciarReservaPage({Key key, this.title = "Gerenciar Reserva"})
      : super(key: key);

  @override
  _GerenciarReservaPageState createState() => _GerenciarReservaPageState();
}

class _GerenciarReservaPageState
    extends ModularState<GerenciarReservaPage, GerenciarReservaController> {
  //use 'controller' variable to access controller

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.green,
        labelColor: Colors.green,
        tabs: [
          Tab(
            text: 'PENDENTES',
          ),
          Tab(
            text: 'CALENDÁRIO',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColorScheme.primaryColor,
          title: Text("Gerenciamento de Reservas"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[ReservasPendentesPage(), CalendarioPage()],
        ),
      ),
    );
  }
}

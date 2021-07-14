import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dados_reserva_controller.dart';

class DadosReservaPage extends StatefulWidget {
  final String title;
  const DadosReservaPage({Key key, this.title = "DadosReserva"})
      : super(key: key);

  @override
  _DadosReservaPageState createState() => _DadosReservaPageState();
}

class _DadosReservaPageState
    extends ModularState<DadosReservaPage, DadosReservaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reserva_controller.dart';

class ReservaPage extends StatefulWidget {
  final String title;
  const ReservaPage({Key key, this.title = "Reserva"}) : super(key: key);

  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends ModularState<ReservaPage, ReservaController> {
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

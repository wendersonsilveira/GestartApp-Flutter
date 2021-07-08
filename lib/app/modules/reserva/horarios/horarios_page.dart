import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'horarios_controller.dart';

class HorariosPage extends StatefulWidget {
  final String title;
  const HorariosPage({Key key, this.title = "Horarios"}) : super(key: key);

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState
    extends ModularState<HorariosPage, HorariosController> {
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

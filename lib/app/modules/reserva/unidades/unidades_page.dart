import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'unidades_controller.dart';

class UnidadesPage extends StatefulWidget {
  final String title;
  const UnidadesPage({Key key, this.title = "Unidades"}) : super(key: key);

  @override
  _UnidadesPageState createState() => _UnidadesPageState();
}

class _UnidadesPageState
    extends ModularState<UnidadesPage, UnidadesController> {
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

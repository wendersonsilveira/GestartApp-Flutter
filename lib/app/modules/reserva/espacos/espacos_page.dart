import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'espacos_controller.dart';

class EspacosPage extends StatefulWidget {
  final String title;
  const EspacosPage({Key key, this.title = "Espacos"}) : super(key: key);

  @override
  _EspacosPageState createState() => _EspacosPageState();
}

class _EspacosPageState extends ModularState<EspacosPage, EspacosController> {
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

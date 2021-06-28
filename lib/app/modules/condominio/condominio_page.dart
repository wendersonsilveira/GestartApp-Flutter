import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'condominio_controller.dart';

class CondominioPage extends StatefulWidget {
  final String title;
  const CondominioPage({Key key, this.title = "Condominio"}) : super(key: key);

  @override
  _CondominioPageState createState() => _CondominioPageState();
}

class _CondominioPageState
    extends ModularState<CondominioPage, CondominioController> {
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

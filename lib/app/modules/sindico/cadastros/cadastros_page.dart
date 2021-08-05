import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastros_controller.dart';

class CadastrosPage extends StatefulWidget {
  final String title;
  const CadastrosPage({Key key, this.title = "Cadastros"}) : super(key: key);

  @override
  _CadastrosPageState createState() => _CadastrosPageState();
}

class _CadastrosPageState
    extends ModularState<CadastrosPage, CadastrosController> {
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

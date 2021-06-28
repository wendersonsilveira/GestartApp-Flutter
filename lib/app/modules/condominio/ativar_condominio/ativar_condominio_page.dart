import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ativar_condominio_controller.dart';

class AtivarCondominioPage extends StatefulWidget {
  final String title;
  const AtivarCondominioPage({Key key, this.title = "AtivarCondominio"})
      : super(key: key);

  @override
  _AtivarCondominioPageState createState() => _AtivarCondominioPageState();
}

class _AtivarCondominioPageState
    extends ModularState<AtivarCondominioPage, AtivarCondominioController> {
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

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_pet_controller.dart';

class CadastroPetPage extends StatefulWidget {
  final String title;
  const CadastroPetPage({Key key, this.title = "CadastroPet"})
      : super(key: key);

  @override
  _CadastroPetPageState createState() => _CadastroPetPageState();
}

class _CadastroPetPageState
    extends ModularState<CadastroPetPage, CadastroPetController> {
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

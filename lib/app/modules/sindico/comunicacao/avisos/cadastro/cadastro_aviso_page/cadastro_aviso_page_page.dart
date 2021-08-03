import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_aviso_page_controller.dart';

class CadastroAvisoPagePage extends StatefulWidget {
  final String title;
  const CadastroAvisoPagePage({Key key, this.title = "CadastroAvisoPage"})
      : super(key: key);

  @override
  _CadastroAvisoPagePageState createState() => _CadastroAvisoPagePageState();
}

class _CadastroAvisoPagePageState
    extends ModularState<CadastroAvisoPagePage, CadastroAvisoPageController> {
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

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'listar_espacos_controller.dart';

class ListarEspacosPage extends StatefulWidget {
  final String title;
  const ListarEspacosPage({Key key, this.title = "Listar Espaços"})
      : super(key: key);

  @override
  _ListarEspacosPageState createState() => _ListarEspacosPageState();
}

class _ListarEspacosPageState
    extends ModularState<ListarEspacosPage, ListarEspacosController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhes_assembleia_controller.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';

class DetalhesAssembleiaPage extends StatefulWidget {
  final String title;
  const DetalhesAssembleiaPage({Key key, this.title = "Assembleia"})
      : super(key: key);

  @override
  _DetalhesAssembleiaPageState createState() => _DetalhesAssembleiaPageState();
}

class _DetalhesAssembleiaPageState
    extends ModularState<DetalhesAssembleiaPage, DetalhesAssembleiaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

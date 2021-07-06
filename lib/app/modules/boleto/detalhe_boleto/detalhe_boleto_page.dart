import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhe_boleto_controller.dart';

class DetalheBoletoPage extends StatefulWidget {
  final String title;
  const DetalheBoletoPage({Key key, this.title = "Boleto Digital"})
      : super(key: key);

  @override
  _DetalheBoletoPageState createState() => _DetalheBoletoPageState();
}

class _DetalheBoletoPageState
    extends ModularState<DetalheBoletoPage, DetalheBoletoController> {
  //use 'controller' variable to access controller

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

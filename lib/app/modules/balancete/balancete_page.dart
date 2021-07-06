import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'balancete_controller.dart';

class BalancetePage extends StatefulWidget {
  final String title;
  const BalancetePage({Key key, this.title = "Balancete"}) : super(key: key);

  @override
  _BalancetePageState createState() => _BalancetePageState();
}

class _BalancetePageState
    extends ModularState<BalancetePage, BalanceteController> {
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

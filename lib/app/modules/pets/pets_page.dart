import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pets_controller.dart';

class PetsPage extends StatefulWidget {
  final String title;
  const PetsPage({Key key, this.title = "Pets"}) : super(key: key);

  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends ModularState<PetsPage, PetsController> {
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

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'avisos_page_controller.dart';

class AvisosPagePage extends StatefulWidget {
  final String title;
  const AvisosPagePage({Key key, this.title = "AvisosPage"}) : super(key: key);

  @override
  _AvisosPagePageState createState() => _AvisosPagePageState();
}

class _AvisosPagePageState
    extends ModularState<AvisosPagePage, AvisosPageController> {
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

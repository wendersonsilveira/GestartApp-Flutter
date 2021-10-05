import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'erro_controller.dart';

class ErroPage extends StatefulWidget {
  final String title;
  final int codeErro;
  const ErroPage({Key key, this.title = "Erro", this.codeErro})
      : super(key: key);

  @override
  _ErroPageState createState() => _ErroPageState();
}

class _ErroPageState extends ModularState<ErroPage, ErroController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    print(widget.codeErro);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Expanded(
        child: Container(
          color: Color.fromRGBO(00, 80, 00, 20),
          height: 150,
          child: Column(
            children: <Widget>[Text('testeste')],
          ),
        ),
      ),
    );
  }
}

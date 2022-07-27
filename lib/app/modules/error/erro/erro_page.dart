import 'package:Gestart/app/modules/error/erro/component/button_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'erro_controller.dart';

class ErroPage extends StatefulWidget {
  final String title;
  final String msgErro;
  const ErroPage({Key key, this.title = "Erro", this.msgErro})
      : super(key: key);

  @override
  _ErroPageState createState() => _ErroPageState();
}

class _ErroPageState extends ModularState<ErroPage, ErroController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    print(Modular.to.path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.warning_amber_rounded,
                  size: 100,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Atenção!',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Text(widget.msgErro),
              ButtonExpandedWidget(
                descricao: 'Recarregar',
                funcao: () {
                  Modular.to.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

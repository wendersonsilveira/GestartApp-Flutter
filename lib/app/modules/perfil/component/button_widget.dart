import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key key, this.descricao, this.funcao, this.cor, this.corTexto})
      : super(key: key);
  final String descricao;
  final Function funcao;
  final Color cor;
  final Color corTexto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: RaisedButton(
            color: cor,
            onPressed: funcao,
            child: Text(
              descricao,
              style: TextStyle(
                color: corTexto,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

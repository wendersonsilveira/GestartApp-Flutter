import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class ButtonExpandedWidget extends StatelessWidget {
  const ButtonExpandedWidget({Key key, this.descricao, this.funcao})
      : super(key: key);
  final String descricao;
  final Function funcao;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: RaisedButton(
              color: AppColorScheme.backgroundColor,
              onPressed: funcao != null ? funcao : null,
              child: Text(
                descricao,
                style: TextStyle(color: AppColorScheme.primaryColor),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: AppColorScheme.primaryColor)),
            ),
          ),
        ),
      ],
    );
  }
}

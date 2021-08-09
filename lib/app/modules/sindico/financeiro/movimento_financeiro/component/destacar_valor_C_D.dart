import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/app/utils/ui_helper.dart';

class DestacarValorCD extends StatelessWidget {
  final double valor;
  const DestacarValorCD({
    Key key,
    this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return valor >= 0
        ? Text(
            '${UIHelper.moneyFormat(valor)}',
            style: TextStyle(color: AppColorScheme.primaryColor),
          )
        : Text(
            '${UIHelper.moneyFormat(valor)}',
            style: TextStyle(color: AppColorScheme.feedbackDangerDark),
          );
  }
}

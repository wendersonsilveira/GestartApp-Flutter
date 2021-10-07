import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class InforConfigWidget extends StatelessWidget {
  final String descricao;
  final int horario;
  const InforConfigWidget({
    Key key,
    this.descricao,
    this.horario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: 150, child: Text(descricao)),
            Text(
              UIHelper.idHoraDescricao(horario),
              style: TextStyle(color: AppColorScheme.primaryColor),
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}

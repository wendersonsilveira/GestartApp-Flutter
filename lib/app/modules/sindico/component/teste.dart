import 'package:Gestart/app/modules/sindico/cadastro_espaco/cadastro_espaco_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinhaDropdownWidget extends StatelessWidget {
  const LinhaDropdownWidget({
    Key key,
    this.descricao,
    @required this.controller,
    this.variavel,
    this.acaoIni,
    this.valorInicial,
  }) : super(key: key);
  final String descricao;
  final int variavel;
  final int valorInicial;
  final Function acaoIni;

  final CadastroEspacoController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          descricao,
          style: TextStyle(
              fontSize: 26.sp,
              fontFamily: 'roboto',
              color: Colors.grey[600],
              fontStyle: FontStyle.normal),
        )),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: DropdownButtonFormField(
              value: valorInicial,
              items: controller.horarios.data.map((e) {
                return DropdownMenuItem(
                  child: Text(e.descricao),
                  value: e.id,
                );
              }).toList(),
              onChanged: acaoIni),
        ),
      ],
    );
  }
}

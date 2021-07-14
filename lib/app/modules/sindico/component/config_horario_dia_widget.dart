import 'package:Gestart/app/modules/sindico/cadastro_espaco/cadastro_espaco_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfigHorarioDiaWidget extends StatelessWidget {
  const ConfigHorarioDiaWidget({
    Key key,
    @required this.controller,
    this.dia,
    this.valorInicial,
    this.acaoIni,
    this.status,
    this.acaoFim,
    this.valorFim,
  }) : super(key: key);

  final CadastroEspacoController controller;
  final String dia;
  final int valorInicial;
  final int valorFim;
  final Function acaoIni;
  final Function acaoFim;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dia,
            style: TextStyle(
                fontSize: 26.sp,
                fontFamily: 'roboto',
                color: Colors.grey[600],
                fontStyle: FontStyle.normal),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: DropdownButton(
                value: valorInicial,
                items: controller.horarios.data.map((e) {
                  return DropdownMenuItem(
                    child: Text(e.descricao),
                    value: e.id,
                  );
                }).toList(),
                onChanged: status ? acaoIni : null),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
              child: DropdownButton(
                  value: valorFim,
                  items: controller.horarios.data.map((e) {
                    return DropdownMenuItem(
                      child: Text(e.descricao),
                      value: e.id,
                    );
                  }).toList(),
                  onChanged: status ? acaoFim : null))
        ],
      ),
    );
  }
}

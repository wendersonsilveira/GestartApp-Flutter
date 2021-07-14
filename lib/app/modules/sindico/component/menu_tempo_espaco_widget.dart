import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuTempoEspacoWidget extends StatelessWidget {
  const MenuTempoEspacoWidget(
      {Key key,
      this.value,
      this.listaValores,
      this.descricao,
      this.acao,
      this.valorInicial})
      : super(key: key);

  final int value;
  final List<HoraEntity> listaValores;
  final Function acao;
  final String descricao;
  final int valorInicial;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
                items: listaValores.map((e) {
                  return DropdownMenuItem(
                    child: Text(e.descricao),
                    value: e.id,
                  );
                }).toList(),
                onChanged: acao),
          ),
        ],
      ),
    );
  }
}

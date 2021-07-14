import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/domain/entities/reserva/hora_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuIntervaloEspacoWidget extends StatelessWidget {
  const MenuIntervaloEspacoWidget(
      {Key key,
      this.value,
      this.listaValores,
      this.descricao,
      this.acao,
      this.valorInicial,
      this.ativo})
      : super(key: key);

  final int value;
  final List<HoraEntity> listaValores;
  final Function acao;
  final String descricao;
  final int valorInicial;
  final bool ativo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                descricao,
                style: TextStyle(
                    fontSize: 26.sp,
                    fontFamily: 'roboto',
                    color: Colors.grey[600],
                    fontStyle: FontStyle.normal),
              )),
          Container(
            child: DropdownButton(
                value: valorInicial,
                items: listaValores.map((e) {
                  return DropdownMenuItem(
                    child: Text(e.descricao),
                    value: e.id,
                  );
                }).toList(),
                onChanged: ativo == false ? null : acao),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
              child: DropdownButton(
                  value: valorInicial,
                  items: listaValores.map((e) {
                    return DropdownMenuItem(
                      child: Text(e.descricao),
                      value: e.id,
                    );
                  }).toList(),
                  onChanged: ativo == false ? null : acao)),
          Switch(
              value: ativo != null ? ativo : true,
              activeColor: AppColorScheme.primaryColor,
              onChanged: acao),
        ],
      ),
    );
  }
}

import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardNovoWidget extends StatelessWidget {
  const CardNovoWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        color: AppColorScheme.white,
        padding: EdgeInsets.all(10),
        child: Text(
            'Caro usuário, não encontramos o seu CPF ou CNPJ na nossa base de dados. Verifique seu cadastro junto á Gestart Condomínios.'));
  }
}

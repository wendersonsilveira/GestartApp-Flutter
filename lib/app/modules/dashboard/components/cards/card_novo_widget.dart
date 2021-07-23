import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class CardNovoWidget extends StatelessWidget {
  const CardNovoWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: AppColorScheme.white,
      padding: EdgeInsets.all(10),
      child: Text(
        'Caro usuário, não encontramos nem um condomínio vinculado ao seu CPF ou CNPJ. Verifique seu cadastro junto á Gestart Condomínios.',
        style: TextStyle(
          color: Color(0xFFBD750A),
        ),
      ),
    );
  }
}

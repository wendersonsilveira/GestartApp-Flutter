import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'button_ativo_service_widget.dart';
import 'button_inativo_service_widget.dart';

class ButtonSercicesWidget extends StatefulWidget {
  const ButtonSercicesWidget(
      {Key key, this.icon, this.descricao, this.condominioAtivo, this.rota})
      : super(key: key);

  final bool condominioAtivo;
  final IconData icon;
  final String descricao;
  final String rota;

  @override
  ButtonSercicesWidgetState createState() => ButtonSercicesWidgetState();
}

class ButtonSercicesWidgetState extends State<ButtonSercicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: widget.condominioAtivo == false
          ? ButtonServicesInativoWidget(
              descricao: widget.descricao,
              icon: widget.icon,
            )
          : ButtonServiceWidget(
              descricao: widget.descricao,
              icon: widget.icon,
              rota: widget.rota,
            ),
    );
  }
}

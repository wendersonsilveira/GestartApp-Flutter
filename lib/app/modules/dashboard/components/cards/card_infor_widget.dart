import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';

import 'card_condominios_inativos_widget.dart';
import 'card_novo_widget.dart';

class CardInfor extends StatelessWidget {
  const CardInfor({
    Key key,
    this.texto,
    this.statusCondominio,
    this.condominio,
  }) : super(key: key);

  final String texto;
  final int statusCondominio;
  final String messageClienteNovo = '';

  final String messageClienteExistente = 'Cliente ja existente';
  final CondominioEntity condominio;

  @override
  Widget build(BuildContext context) {
    if (statusCondominio == 0)
      return CardNovoWidget();
    else if (statusCondominio == 1)
      return CardCondInativosWidget(
        condominio: condominio,
      );
    else
      return Container();
  }
}

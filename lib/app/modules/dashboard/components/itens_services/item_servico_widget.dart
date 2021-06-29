import 'package:Gestart/app/modules/dashboard/components/itens_services/item_servico_desabilitado_widget.dart';
import 'package:Gestart/app/modules/dashboard/components/itens_services/item_servico_habilitado_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ItemServicoWidget extends StatelessWidget {
  const ItemServicoWidget(
      {Key key,
      this.condominioAtivo,
      this.descricao,
      this.icone,
      this.routeName})
      : super(key: key);

  final bool condominioAtivo;
  final String descricao;
  final IconData icone;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Column(
          children: [
            condominioAtivo == false
                ? ItemServicoDesabilitadoWidget(
                    descricao: descricao, icone: icone)
                : ItemServicoHabilitadoWidget(
                    descricao: descricao,
                    icone: icone,
                    routeName: routeName,
                  ),
          ],
        ));
  }
}

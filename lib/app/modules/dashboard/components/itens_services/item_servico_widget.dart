import 'package:Gestart/app/modules/dashboard/components/itens_services/item_servico_desabilitado_widget.dart';
import 'package:Gestart/app/modules/dashboard/components/itens_services/item_servico_habilitado_widget.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';

class ItemServicoWidget extends StatelessWidget {
  const ItemServicoWidget(
      {Key key,
      this.condominioAtivo,
      this.descricao,
      this.icone,
      this.routeName,
      this.condominios})
      : super(key: key);

  final bool condominioAtivo;
  final String descricao;
  final IconData icone;
  final String routeName;
  final List<CondominioEntity> condominios;
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
                    condominios: condominios,
                  ),
          ],
        ));
  }
}

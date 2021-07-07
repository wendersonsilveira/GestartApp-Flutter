import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonDocumentoWidget extends StatelessWidget {
  const ButtonDocumentoWidget({
    Key key,
    this.edital,
    this.tipoDocumento,
    this.disponivel,
    this.link,
  }) : super(key: key);
  final EditalEntity edital;
  final String tipoDocumento;
  final int disponivel;
  final String link;
  @override
  Widget build(BuildContext context) {
    return disponivel == null || disponivel == 0
        ? FlatButtonWidget(
            text: "${tipoDocumento} AINDA NÃO DISPONIVEL",
            onPressed: () => print('teste'),
            cor: Colors.grey,
          )
        : FlatButtonWidget(
            text: "VISUALIZAR ${tipoDocumento}",
            onPressed: () => Modular.navigator.pushNamed(
                RouteName.view_documento,
                arguments: [link, tipoDocumento]),
            cor: AppColorScheme.primaryColor,
          );
  }
}

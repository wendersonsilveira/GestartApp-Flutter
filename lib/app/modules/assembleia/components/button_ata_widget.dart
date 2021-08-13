import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:Gestart/app/widgets/download/download_button_widget.dart';
import 'package:Gestart/domain/entities/assembleia/edital_entity.dart';
import 'package:flutter/material.dart';

class ButtonDocumentoWidget extends StatelessWidget {
  final EditalEntity edital;
  final String tipoDocumento;
  final int disponivel;
  final String link;
  final String fileName;
  const ButtonDocumentoWidget({
    Key key,
    this.edital,
    this.tipoDocumento,
    this.disponivel,
    this.link,
    this.fileName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return disponivel == null || disponivel == 0
        ? FlatButtonWidget(
            text: "$tipoDocumento AINDA NÃO DISPONIVEL",
            onPressed: () => null,
            cor: Colors.grey,
          )
        : DownloadButtonWidget(
            title: "VISUALIZAR $tipoDocumento",
            color: AppColorScheme.primaryColor,
            fileName: fileName,
            fileURL: link,
          );
  }
}

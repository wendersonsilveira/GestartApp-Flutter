import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'relatorio_inadimplencia_controller.dart';

class RelatorioInadimplenciaPage extends StatefulWidget {
  final String title;
  const RelatorioInadimplenciaPage(
      {Key key, this.title = "Relatório de reservas"})
      : super(key: key);

  @override
  _RelatorioInadimplenciaPageState createState() =>
      _RelatorioInadimplenciaPageState();
}

class _RelatorioInadimplenciaPageState extends ModularState<
    RelatorioInadimplenciaPage, RelatorioInadimplenciaController> {
  bool enableButton = false;
  DateTime startDate;
  DateTime endDate;
  @override
  void initState() {
    super.initState();
    // controller.getAvisos();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
          builder: (_) => Center(
                child: SingleChildScrollView(
                  child: Container(
                    child: Text('Teste'),
                  ),
                ),
              )),
    );
  }
}

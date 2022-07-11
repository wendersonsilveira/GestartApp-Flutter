import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';
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
      {Key key, this.title = "Relatório de inadimplência"})
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

  _setFiltros() {
    if (controller.dataIni == null || controller.dataFim == null)
      CustomAlertDialog.info(
          context,
          'Periodo obrigatorio',
          'Favor inserir Data Inicial e Data Final para consulta do relatório',
          (_) => Modular.navigator.pop());
    else if (controller.dataIni == null && controller.dataFim == null)
      CustomAlertDialog.info(
          context,
          'Periodo obrigatorio',
          'Favor inserir periodo para consulta do relatório',
          (_) => Modular.navigator.pop());
    else
      controller.setFiltros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
          onTap: () => _setFiltros(),
          child: Container(
            height: 50,
            color: AppColorScheme.primaryColor,
            child: Center(
              child: Text(
                "Pesquisar",
                style: TextStyle(color: AppColorScheme.white),
              ),
            ),
          )),
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
          builder: (_) => Center(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        controller.unidades.status == Status.loading
                            ? CircularProgressIndicator()
                            : Column(
                                children: [
                                  Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          child: Text(
                                              "Insira os filtros para configurar seu relatório"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownSearch<UnidadeEntity>(
                                            mode: Mode.BOTTOM_SHEET,
                                            showSearchBox: true,
                                            items: controller.unidades.data,
                                            showClearButton: true,
                                            itemAsString: (UnidadeEntity u) =>
                                                u.unidadeAsString(),
                                            label: 'Unidade',
                                            hint: 'Unidade',
                                            onChanged: (v) => v != null
                                                ? controller.setCodImo(v.codimo)
                                                : controller.setCodImo(null),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownSearch<TaxaEntity>(
                                            mode: Mode.BOTTOM_SHEET,
                                            showSearchBox: true,
                                            items: controller.tiposTaxa.data,
                                            showClearButton: true,
                                            itemAsString: (TaxaEntity t) =>
                                                t.taxaAsString(),
                                            label: 'Taxa',
                                            hint: 'Taxa',
                                            onChanged: (value) => value != null
                                                ? controller
                                                    .setTipTax(value.tiptax)
                                                : controller.setTipTax(null),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownSearch<dynamic>(
                                            mode: Mode.BOTTOM_SHEET,
                                            items: [
                                              "Administrativo",
                                              "Jurídico",
                                            ],
                                            showClearButton: true,
                                            // smallSheet: true,
                                            label: 'Tipo de cobrança',
                                            hint: 'Tipo de cobrança',
                                            onChanged: (tipC) => tipC != null
                                                ? controller.setTipCob(tipC)
                                                : controller.setTipCob(null),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                child: Text('Período'),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  startDate != null
                                                      ? Text(
                                                          UIHelper.formatDate(
                                                              startDate))
                                                      : Text('Data Inicial'),
                                                  Text('-'),
                                                  endDate != null
                                                      ? Text(
                                                          UIHelper.formatDate(
                                                              endDate))
                                                      : Text('Data Final'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SfDateRangePicker(
                                          view: DateRangePickerView.month,
                                          headerStyle:
                                              DateRangePickerHeaderStyle(
                                                  textAlign: TextAlign.center),
                                          selectionMode:
                                              DateRangePickerSelectionMode
                                                  .range,
                                          onSelectionChanged: (v) => {
                                            setState(() {
                                              startDate = v.value.startDate;
                                              endDate = v.value.endDate;
                                              if (v.value.endDate != null) {
                                                enableButton = !enableButton;
                                                controller.setDataInicial(
                                                    UIHelper.formatDate(
                                                        startDate));
                                                controller.setDataFinal(
                                                    UIHelper.formatDate(
                                                        endDate));
                                              }
                                            })
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}

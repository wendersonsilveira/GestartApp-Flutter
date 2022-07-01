import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/domain/entities/reserva/espaco_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'relatorio_reservas_controller.dart';

class RelatorioReservasPage extends StatefulWidget {
  final String title;
  const RelatorioReservasPage({Key key, this.title = "Relatório de reservas"})
      : super(key: key);

  @override
  _RelatorioReservasPageState createState() => _RelatorioReservasPageState();
}

class _RelatorioReservasPageState
    extends ModularState<RelatorioReservasPage, RelatorioReservasController> {
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
      bottomNavigationBar: GestureDetector(
          onTap: () => controller.setFiltros(),
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
                                            label: "Unidade",
                                            hint: "Unidade",
                                            onChanged: (unidade) => controller
                                                .setUnidade(unidade.codimo),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownSearch<EspacoEntity>(
                                            mode: Mode.BOTTOM_SHEET,
                                            showSearchBox: true,
                                            items: controller.espacos.data,
                                            showClearButton: true,
                                            itemAsString: (EspacoEntity u) =>
                                                u.espacoAsString(),
                                            label: "Espaço",
                                            hint: "Espaço",
                                            onChanged: (espaco) =>
                                                controller.setEspaco(espaco.id),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownSearch<String>(
                                              mode: Mode.BOTTOM_SHEET,
                                              showClearButton: true,
                                              items: [
                                                "Aguardando aprovação",
                                                "Aprovado",
                                                "Rejeitado",
                                                "Cancelado"
                                              ],
                                              smallSheet: true,
                                              label: "Status",
                                              hint: "Status",
                                              onChanged: (v) =>
                                                  controller.setStatus(v)),
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
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}

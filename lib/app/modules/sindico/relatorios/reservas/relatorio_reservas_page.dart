import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
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

  final dataIniController = TextEditingController();
  final dataFimController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    dataIniController.dispose();
    dataFimController.dispose();
    super.dispose();
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
          builder: (_) => SingleChildScrollView(
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
                                          onChanged: (unidade) => unidade !=
                                                  null
                                              ? controller
                                                  .setUnidade(unidade.codimo)
                                              : controller.setUnidade(null),
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
                                          onChanged: (espaco) => espaco != null
                                              ? controller.setEspaco(espaco.id)
                                              : controller.setEspaco(null),
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
                                            // smallSheet: true,
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
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    textAlign: TextAlign.center,
                                                    controller:
                                                        dataIniController,
                                                    onTap: () async {
                                                      final startDate =
                                                          await showDatePicker(
                                                        builder:
                                                            (context, child) {
                                                          return Theme(
                                                            data: Theme.of(
                                                                    context)
                                                                .copyWith(
                                                              colorScheme:
                                                                  ColorScheme
                                                                      .light(
                                                                primary:
                                                                    AppColorScheme
                                                                        .primaryColor, // header background color
                                                                onPrimary: Colors
                                                                    .white, // header text color
                                                                onSurface: Colors
                                                                    .black87, // body text color
                                                              ),
                                                              textButtonTheme:
                                                                  TextButtonThemeData(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      AppColorScheme
                                                                          .primaryColor, // button text color
                                                                ),
                                                              ),
                                                            ),
                                                            child: child,
                                                          );
                                                        },
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2017),
                                                        lastDate:
                                                            DateTime(2024),
                                                      );
                                                      controller.setDataInicial(
                                                          UIHelper.formatDate(
                                                              startDate));

                                                      dataIniController.text =
                                                          UIHelper.formatDate(
                                                              startDate);
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: 'Data inicial',
                                                      contentPadding: EdgeInsets.all(5),
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                                      suffixIcon: Icon(
                                                          Icons.date_range),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Expanded(
                                                  child: TextField(
                                                    textAlign: TextAlign.center,
                                                    controller:
                                                        dataFimController,
                                                    onTap: () async {
                                                      final finalDate =
                                                          await showDatePicker(
                                                        builder:
                                                            (context, child) {
                                                          return Theme(
                                                            data: Theme.of(
                                                                    context)
                                                                .copyWith(
                                                              colorScheme:
                                                                  ColorScheme
                                                                      .light(
                                                                primary:
                                                                    AppColorScheme
                                                                        .primaryColor, // header background color
                                                                onPrimary: Colors
                                                                    .white, // header text color
                                                                onSurface: Colors
                                                                    .black87, // body text color
                                                              ),
                                                              textButtonTheme:
                                                                  TextButtonThemeData(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      AppColorScheme
                                                                          .primaryColor, // button text color
                                                                ),
                                                              ),
                                                            ),
                                                            child: child,
                                                          );
                                                        },
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2017),
                                                        lastDate:
                                                            DateTime(2024),
                                                      );
                                                      controller.setDataFinal(
                                                          UIHelper.formatDate(
                                                              finalDate));
                                                      dataFimController.text =
                                                          UIHelper.formatDate(
                                                              finalDate);
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: 'Data final',
                                                      contentPadding: EdgeInsets.all(5),
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                                      suffixIcon: Icon(
                                                          Icons.date_range),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              )),
    );
  }
}

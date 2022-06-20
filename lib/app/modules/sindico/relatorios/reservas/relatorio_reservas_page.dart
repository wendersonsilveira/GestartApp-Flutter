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
  const RelatorioReservasPage({Key key, this.title = "Relatorio de reservas"})
      : super(key: key);

  @override
  _RelatorioReservasPageState createState() => _RelatorioReservasPageState();
}

class _RelatorioReservasPageState
    extends ModularState<RelatorioReservasPage, RelatorioReservasController> {
  bool showDatePicker = true;
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
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   isExtended: false,
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   // icon: Icon(Icons.supervised_user_circle),
      //   label: Text('Fixed Button'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: GestureDetector(
          onTap: () {},
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
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                            "Insira os filtros para configurar seu relatorio"),
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
                                          label: "Espaco",
                                          hint: "Espaco",
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
                                            "Ativo",
                                            "Cancelado",
                                            "Rejeitado"
                                          ],
                                          smallSheet: true,
                                          label: "Status",
                                          hint: "Status",
                                          onChanged: (v) => print(v),
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
                                              child: Text('Periodo'),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                startDate != null
                                                    ? Text(UIHelper.formatDate(
                                                        startDate))
                                                    : Text('Data Inicial'),
                                                Text('-'),
                                                endDate != null
                                                    ? Text(UIHelper.formatDate(
                                                        endDate))
                                                    : Text('Data Final'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      showDatePicker
                                          ? SfDateRangePicker(
                                              view: DateRangePickerView.month,
                                              selectionMode:
                                                  DateRangePickerSelectionMode
                                                      .range,
                                              onSelectionChanged: (v) => {
                                                setState(() {
                                                  startDate = v.value.startDate;
                                                  endDate = v.value.endDate;
                                                  // if (v.value.endDate != null)
                                                  //   showDatePicker =
                                                  //       !showDatePicker;
                                                })
                                              },
                                            )
                                          : Container(),
                                      // ElevatedButton(
                                      //   style: ElevatedButton.styleFrom(
                                      //     primary: endDate != null &&
                                      //             startDate != null
                                      //         ? AppColorScheme.primaryColor
                                      //         : AppColorScheme.tagGreen2,
                                      //     minimumSize: Size.fromHeight(
                                      //         40), // fromHeight use double.infinity as width and 40 is the height
                                      //   ),
                                      //   onPressed: () {},
                                      //   child: Text('Pesquisar'),
                                      // )
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

import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';

import 'incidencias_inadimplencia_controller.dart';

class IncidenciasInadimplenciaPage extends StatefulWidget {
  final String title;
  final SendParamsRelInadimplenciaEntity params;
  const IncidenciasInadimplenciaPage(
      {Key key, this.title = "Relatório de inadimplência", this.params})
      : super(key: key);

  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends ModularState<IncidenciasInadimplenciaPage,
    IncidenciasInadimplenciaController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (_) {
        switch (controller.incidenciasInadimplenciasUnidade.status) {
          case Status.loading:
            return CircularProgressCustom();
            break;
          case Status.failed:
            return PageError(
              messageError:
                  controller.incidenciasInadimplenciasUnidade.error.message,
            );
          default:
            return controller.incidenciasInadimplenciasUnidade.data.isEmpty
                ? EmptyWidget(
                    descricao: 'Incidencias Inexistente',
                  )
                : ListView.builder(
                    itemCount:
                        controller.incidenciasInadimplenciasUnidade.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 400,
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.all(8),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 0,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text('Tipo: '),
                                              Text(
                                                  controller
                                                      .incidenciasInadimplenciasUnidade
                                                      .data[index]
                                                      .nomTip,
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 13))
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (controller
                                              .incidenciasInadimplenciasUnidade
                                              .data[index]
                                              .datInc !=
                                          null)
                                        Card(
                                          elevation: 0,
                                          child: ListTile(
                                            title: Row(
                                              children: [
                                                Text('Data inclusão: '),
                                                Text(
                                                    UIHelper.formatDate(controller
                                                        .incidenciasInadimplenciasUnidade
                                                        .data[index]
                                                        .datInc),
                                                    style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 13))
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (controller
                                              .incidenciasInadimplenciasUnidade
                                              .data[index]
                                              .datDis !=
                                          null)
                                        Card(
                                          elevation: 0,
                                          child: ListTile(
                                            title: Row(
                                              children: [
                                                Text('Data distribuição: '),
                                                Text(
                                                    UIHelper.formatDate(controller
                                                        .incidenciasInadimplenciasUnidade
                                                        .data[index]
                                                        .datDis),
                                                    style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 13))
                                              ],
                                            ),
                                          ),
                                        ),
                                      Card(
                                        elevation: 0,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text('Val. dívida: '),
                                              Text(
                                                  UIHelper.moneyFormat(controller
                                                      .incidenciasInadimplenciasUnidade
                                                      .data[index]
                                                      .valDiv),
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 13))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 0,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text('N° documento: '),
                                              Text(
                                                  controller
                                                      .incidenciasInadimplenciasUnidade
                                                      .data[index]
                                                      .numDoc,
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 13))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 0,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text('Cartorio'),
                                              Text(
                                                  controller
                                                      .incidenciasInadimplenciasUnidade
                                                      .data[index]
                                                      .nomCar,
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 13))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Divider(
                              // indent: 5,
                              thickness: 3,
                              // height: 100,
                            )
                          ],
                        ),
                      );
                    });
        }
      },
    ));
  }
}

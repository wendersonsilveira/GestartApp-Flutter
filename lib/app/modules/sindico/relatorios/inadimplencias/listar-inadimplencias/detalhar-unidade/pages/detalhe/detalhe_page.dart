import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';

import '../../detalhar_unidade_controller.dart';
import 'detalhe_controller.dart';

class DetalhePage extends StatefulWidget {
  final String title;
  final SendParamsRelInadimplenciaEntity params;
  const DetalhePage(
      {Key key, this.title = "Relatório de inadimplência", this.params})
      : super(key: key);

  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends ModularState<DetalhePage, DetalheController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (_) {
        switch (controller.inadimplenciasUnidade.status) {
          case Status.loading:
            return CircularProgressCustom();
            break;
          case Status.failed:
            return PageError(
              messageError: controller.inadimplenciasUnidade.error.message,
            );
          default:
            return ListView.builder(
                itemCount: controller.inadimplenciasUnidade.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 0,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    controller.inadimplenciasUnidade.data[index]
                                            .mesAno +
                                        ' - ' +
                                        controller.inadimplenciasUnidade
                                            .data[index].histor,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Venc.',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                UIHelper.formatDate(controller
                                                    .inadimplenciasUnidade
                                                    .data[index]
                                                    .datVen),
                                                style: TextStyle(fontSize: 10))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Val. Principal',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                UIHelper.moneyFormat(controller
                                                    .inadimplenciasUnidade
                                                    .data[index]
                                                    .valMen),
                                                style: TextStyle(fontSize: 10))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Encargos',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                UIHelper.moneyFormat(controller
                                                    .inadimplenciasUnidade
                                                    .data[index]
                                                    .multa),
                                                style: TextStyle(fontSize: 10))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Val. Total',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                UIHelper.moneyFormat(controller
                                                    .inadimplenciasUnidade
                                                    .data[index]
                                                    .total),
                                                style: TextStyle(fontSize: 10))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
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

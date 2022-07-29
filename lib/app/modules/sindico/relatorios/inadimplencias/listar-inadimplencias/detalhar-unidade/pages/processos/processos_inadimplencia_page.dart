import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';

import 'processos_inadimplencia_controller.dart';

class ProcessosInadimplenciaPage extends StatefulWidget {
  final int codOrd;
  const ProcessosInadimplenciaPage({Key key, this.codOrd}) : super(key: key);

  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends ModularState<ProcessosInadimplenciaPage,
    ProcessosInadimplenciaController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.codOrd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (_) {
        switch (controller.processosInadimplenciasUnidade.status) {
          case Status.loading:
            return CircularProgressCustom();
            break;
          case Status.failed:
            return PageError(
              messageError:
                  controller.processosInadimplenciasUnidade.error.message,
            );
          default:
            return controller.processosInadimplenciasUnidade.data.isEmpty
                ? EmptyWidget(
                    descricao: 'Processos Inexistente',
                  )
                : ListView.builder(
                    itemCount:
                        controller.processosInadimplenciasUnidade.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Card(
                          child: ListTile(
                            title: Text(controller
                                .processosInadimplenciasUnidade
                                .data[index]
                                .nomFas),
                            subtitle: Text(
                                UIHelper.formatDate(controller
                                        .processosInadimplenciasUnidade
                                        .data[index]
                                        .datEmi) +
                                    ' - ' +
                                    controller.processosInadimplenciasUnidade
                                        .data[index].numPro,
                                style: TextStyle(fontSize: 10)),
                          ),
                        ),
                      );
                    });
            ;
        }
      },
    ));
  }
}

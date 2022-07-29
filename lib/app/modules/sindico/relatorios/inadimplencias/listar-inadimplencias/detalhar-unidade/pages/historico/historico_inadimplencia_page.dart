import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';

import 'historico_inadimplencia_controller.dart';

class HistoricoInadimplenciaPage extends StatefulWidget {
  final String title;
  final SendParamsRelInadimplenciaEntity params;
  const HistoricoInadimplenciaPage(
      {Key key, this.title = "Relatório de inadimplência", this.params})
      : super(key: key);

  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends ModularState<HistoricoInadimplenciaPage,
    HistoricoInadimplenciaController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      switch (controller.historicoInadimplenciasUnidade.status) {
        case Status.loading:
          return CircularProgressCustom();
          break;
        case Status.failed:
          return PageError(
            messageError:
                controller.historicoInadimplenciasUnidade.error.message,
          );
        default:
          return ListView.builder(
              itemCount: controller.historicoInadimplenciasUnidade.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      title: Text(UIHelper.formatDate(controller
                          .historicoInadimplenciasUnidade.data[index].datemi)),
                      subtitle: Text(
                          controller.historicoInadimplenciasUnidade.data[index]
                              .historico,
                          style: TextStyle(fontSize: 10)),
                    ),
                  ),
                );
              });
      }
    }));
  }
}

import 'package:Gestart/app/modules/sindico/relatorios/boletos/boletos-unidade/boletos_unidade_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/types/info_dialog.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BoletosUnidadePage extends StatefulWidget {
  final String title;
  final int codord;
  const BoletosUnidadePage({Key key, this.title = "Faturas", this.codord})
      : super(key: key);

  @override
  _BoletosUnidadePageState createState() => _BoletosUnidadePageState();
}

class _BoletosUnidadePageState
    extends ModularState<BoletosUnidadePage, BoletosUnidadeController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.codord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          switch (controller.boletos.status) {
            case Status.failed:
              return PageError(
                  messageError: controller.boletos.error.message,
                  onPressed: controller.init);
              break;
            case Status.loading:
              return CircularProgressCustom();
              break;
            default:
              return controller.boletos.data.isEmpty
                  ? EmptyWidget(
                      descricao:
                          'Não foram identificadas faturas para esta unidade',
                    )
                  : Container(
                      child: ListView.builder(
                          itemCount: controller.boletos.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      controller.getBoletosDetalhes(
                                          controller.boletos.data[index].conts);
                                    },
                                    leading: Icon(FlutterIcons.barcode_ant),
                                    title: Text(
                                        'Vencimento: ${UIHelper.formatDateFromDateTime(controller.boletos.data[index].datven)}'),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${controller.boletos.data[index].lansDetail}'),
                                        Text('Valor : ${controller.boletos.data[index].total}')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
          }
        }));
  }
}

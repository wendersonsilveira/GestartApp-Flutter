import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/download/download_button_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhe_balancete_controller.dart';

class DetalheBalancetePage extends StatefulWidget {
  final String title;

  final int idBalancete;
  const DetalheBalancetePage(
      {Key key, this.title = "Detalhe Balancete", @required this.idBalancete})
      : super(key: key);

  @override
  _DetalheBalancetePageState createState() => _DetalheBalancetePageState();
}

class _DetalheBalancetePageState
    extends ModularState<DetalheBalancetePage, DetalheBalanceteController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init(idBalancete: widget.idBalancete);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          switch (controller.balancete.status) {
            case Status.success:
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.balancete.data.apelido,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColorScheme.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Competência: ${controller.balancete.data.mesAno}'),
                                  Text(
                                      'Período: ${UIHelper.formatDate(controller.balancete.data.dt1)} - ${UIHelper.formatDate(controller.balancete.data.dt2)}'),
                                  Divider(),
                                  DownloadButtonWidget(
                                    title: 'Analítico',
                                    fileURL: controller
                                        .balancete.data.linkBalanceteAna,
                                    color: AppColorScheme.primaryColor,
                                    fileName:
                                        'Balancete_Analitico_${controller.balancete.data.apelido}_${controller.balancete.data.mesAno}_v${controller.balancete.data.versao}.${controller.balancete.data.tipo}',
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  DownloadButtonWidget(
                                    title: 'Sintético',
                                    fileURL: controller
                                        .balancete.data.linkBalanceteSin,
                                    color: AppColorScheme.primaryColor,
                                    fileName:
                                        'Balancete_Sintetico_${controller.balancete.data.apelido}_${controller.balancete.data.mesAno}_v${controller.balancete.data.versao}.${controller.balancete.data.tipo}',
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  DownloadButtonWidget(
                                    title: 'Digital',
                                    fileURL: controller
                                        .balancete.data.linkBalanceteDigital,
                                    color: AppColorScheme.primaryColor,
                                    fileName:
                                        'Balancete_Digital_${controller.balancete.data.apelido}_${controller.balancete.data.mesAno}_v${controller.balancete.data.versao}.${controller.balancete.data.tipo}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
              break;
            case Status.failed:
              return PageError(
                messageError: "Erro ao carregar as informações",
                onPressed: () =>
                    controller.init(idBalancete: widget.idBalancete),
              );
              break;
            default:
              return Center(child: CircularProgressCustom());
          }
        }));
  }
}

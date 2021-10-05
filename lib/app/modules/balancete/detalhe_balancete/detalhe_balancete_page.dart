import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/download/download_button_widget.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhe_balancete_controller.dart';

class DetalheBalancetePage extends StatefulWidget {
  final String title;
  final BalanceteEntity balancete;
  const DetalheBalancetePage(
      {Key key, this.title = "Detalhe Balancete", @required this.balancete})
      : super(key: key);

  @override
  _DetalheBalancetePageState createState() => _DetalheBalancetePageState();
}

class _DetalheBalancetePageState
    extends ModularState<DetalheBalancetePage, DetalheBalanceteController> {
  //use 'controller' variable to access controller
  BalanceteEntity balancete;
  @override
  void initState() {
    balancete = widget.balancete;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Column(
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
                            balancete.apelido,
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColorScheme.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Competência: ${balancete.mesAno}'),
                          Text(
                              'Período: ${UIHelper.formatDate(balancete.dt1)} - ${UIHelper.formatDate(balancete.dt2)}'),
                          Divider(),
                          DownloadButtonWidget(
                            title: 'Analítico',
                            fileURL: null,
                            color: AppColorScheme.primaryColor,
                            fileName:
                                'Balancete_Analitico_${balancete.apelido}_${balancete.mesAno}_v${balancete.versao}.${balancete.tipo}',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DownloadButtonWidget(
                            title: 'Sintético',
                            fileURL: balancete.linkBalanceteSin,
                            color: AppColorScheme.primaryColor,
                            fileName:
                                'Balancete_Sintetico_${balancete.apelido}_${balancete.mesAno}_v${balancete.versao}.${balancete.tipo}',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DownloadButtonWidget(
                            title: 'Dígital',
                            fileURL: balancete.linkBalanceteDigital,
                            color: AppColorScheme.primaryColor,
                            fileName:
                                'Balancete_Digital_${balancete.apelido}_${balancete.mesAno}_v${balancete.versao}.${balancete.tipo}',
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
      ),
    );
  }
}

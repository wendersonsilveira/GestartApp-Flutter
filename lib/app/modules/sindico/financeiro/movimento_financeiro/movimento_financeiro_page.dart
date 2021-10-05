import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_search_button_custom.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'movimento_financeiro_controller.dart';

class MovimentoFinanceiroPage extends StatefulWidget {
  final String title;
  const MovimentoFinanceiroPage({Key key, this.title = "Movimento Financeiro"})
      : super(key: key);

  @override
  _MovimentoFinanceiroPageState createState() =>
      _MovimentoFinanceiroPageState();
}

class _MovimentoFinanceiroPageState extends ModularState<
    MovimentoFinanceiroPage, MovimentoFinanceiroController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init();
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
        switch (controller.statusPage) {
          case 0:
            return CircularProgressCustom();
            break;
          case 1:
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 60,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.mudarPeriodo(1);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.height / 6,
                            child: IconButton(
                                icon: Icon(Icons.keyboard_arrow_left),
                                onPressed: null),
                          ),
                        ),
                        DropdownSearchButtonWidget(
                            value: controller
                                .meses.data[controller.mesIndex].mesAno,
                            height: MediaQuery.of(context).size.height / 2,
                            onSelected: (value) =>
                                controller.inserirMesAtual(value),
                            items: controller.meses.data
                                .map(
                                  (e) => DropdownSearchButtonItem(
                                      title: Text(e.mesAno), value: e.mesAno),
                                )
                                .toList()),
                        GestureDetector(
                          onTap: () {
                            controller.mudarPeriodo(-1);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.height / 6,
                              child: IconButton(
                                  color: Colors.green,
                                  icon: Icon(Icons.keyboard_arrow_right),
                                  onPressed: null)),
                        ),
                      ],
                    ),
                  ),
                  controller.movimentacao.status == Status.loading
                      ? CircularProgressCustom()
                      : Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              controller.saldo < 0
                                  ? Text(
                                      UIHelper.moneyFormat(controller.saldo),
                                      style: TextStyle(
                                          color:
                                              AppColorScheme.feedbackDangerDark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    )
                                  : Text(
                                      UIHelper.moneyFormat(controller.saldo),
                                      style: TextStyle(
                                          color: AppColorScheme.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('SALDO TOTAL'),
                              Card(
                                margin: EdgeInsets.all(10),
                                child: Container(
                                  child: Column(
                                    children:
                                        controller.movimentacao.data.map((e) {
                                      return Column(
                                        children: [
                                          ListTile(
                                              onTap: () => Modular.navigator
                                                  .pushNamed(
                                                      RouteName
                                                          .movimento_financeiro_detalhe,
                                                      arguments: e),
                                              trailing: Icon(Icons.arrow_right),
                                              title: e.nomSal != null
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2,
                                                            child:
                                                                Text(e.nomSal)),
                                                        e.saldo < 0
                                                            ? Text(
                                                                UIHelper
                                                                    .moneyFormat(
                                                                        e.saldo),
                                                                style: TextStyle(
                                                                    color: AppColorScheme
                                                                        .feedbackDangerDark),
                                                              )
                                                            : Text(
                                                                UIHelper
                                                                    .moneyFormat(
                                                                        e.saldo),
                                                                style: TextStyle(
                                                                    color: AppColorScheme
                                                                        .primaryColor),
                                                              )
                                                      ],
                                                    )
                                                  : Text(''),
                                              subtitle: e.codAgencia != null &&
                                                      e.numConta != null
                                                  ? Text(
                                                      '${e.codAgencia} / ${e.numConta}')
                                                  : null),
                                          Divider()
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            );
          default:
            return Center(
              child: PageError(
                messageError: 'Erro ao carregar as informações ',
                onPressed: () => controller.init(),
              ),
            );
        }
      }),
    );
  }
}

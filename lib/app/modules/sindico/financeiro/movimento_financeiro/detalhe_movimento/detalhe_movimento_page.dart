import 'package:Gestart/app/modules/sindico/financeiro/movimento_financeiro/component/destacar_valor_C_D.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhe_movimento_controller.dart';

class DetalheMovimentoPage extends StatefulWidget {
  final MovFinanceiroEntity movimentacao;
  const DetalheMovimentoPage({Key key, this.movimentacao}) : super(key: key);

  @override
  _DetalheMovimentoPageState createState() => _DetalheMovimentoPageState();
}

class _DetalheMovimentoPageState
    extends ModularState<DetalheMovimentoPage, DetalheMovimentoController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init(widget.movimentacao);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text('Movimento de ${widget.movimentacao.mesAno}'),
        ),
        body: Observer(builder: (_) {
          switch (controller.dados.status) {
            case Status.loading:
              return CircularProgressCustom();
              break;
            case Status.failed:
              return PageError(
                messageError: 'Erro ao carregar as informações de dados ',
                onPressed: () => controller.init(widget.movimentacao),
              );
            default:
              return controller.status == true
                  ? SingleChildScrollView(
                      child: Container(
                        child: Column(children: [
                          if (controller.extratoDia.length == 0)
                            Container(
                              child: Column(
                                children: controller.extratoVazio.map((e) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(e.hisLan),
                                        trailing: DestacarValorCD(
                                          valor: e.valLan,
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          if (controller.extratoDia.length > 0)
                            controller.saldoAnterior.contaDescricao != null
                                ? ListTile(
                                    title: Text(controller
                                        .saldoAnterior.contaDescricao),
                                  )
                                : Container(),
                          if (controller.extratoDia.length > 0)
                            ListTile(
                              title: Text('Saldo Inicial'),
                              trailing: DestacarValorCD(
                                  valor:
                                      controller.saldoAnterior.saldoAnterior),
                            ),
                          Container(
                            child: Column(
                              children: controller.extratoDia.map((ele) {
                                return Column(
                                  children: [
                                    ele['DATLAN'] != null
                                        ? Container(
                                            child: Column(
                                              children: [
                                                Card(
                                                  color: Colors.grey[100],
                                                  child: ListTile(
                                                    title: Text(
                                                        "${UIHelper.formatDate(ele['DATLAN'])} - ${UIHelper.diaSemanaDate(ele['DATLAN'])} "),
                                                    leading: Icon(
                                                        Icons.calendar_today),
                                                  ),
                                                ),
                                                Column(
                                                    children: ele['lans']
                                                        .map<Widget>((e) {
                                                  return e.idSisPag == 0
                                                      ? Container(
                                                          child: ListTile(
                                                          title: Text(
                                                            e.hisLan,
                                                          ),
                                                          trailing:
                                                              DestacarValorCD(
                                                            valor: e.valLan,
                                                          ),
                                                        ))
                                                      : Container(
                                                          child: Column(
                                                            children: e.sisPags
                                                                .map<Widget>(
                                                                    (sis) {
                                                              return Container(
                                                                child: Column(
                                                                  children: sis
                                                                      .map<Widget>(
                                                                          (e) {
                                                                    return Column(
                                                                      children: [
                                                                        ListTile(
                                                                          title:
                                                                              Text(e.hisLan),
                                                                          trailing:
                                                                              DestacarValorCD(
                                                                            valor:
                                                                                e.valLan,
                                                                          ),
                                                                        ),
                                                                        Divider()
                                                                      ],
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        );
                                                }).toList()),
                                                Divider(),
                                                ListTile(
                                                    title: Text(
                                                        'Saldo do dia ${UIHelper.formatDateMesAno(ele['DATLAN'])}'),
                                                    trailing: DestacarValorCD(
                                                      valor: ele['SALDO_DIA'],
                                                    ))
                                              ],
                                            ),
                                          )
                                        : Text('')
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          Divider(),
                          if (controller.extratoDia.length > 0)
                            ListTile(
                              title: Text('Saldo Final: '),
                              trailing: DestacarValorCD(
                                valor: controller.extratoDia.last['SALDO_DIA'],
                              ),
                            )
                        ]),
                      ),
                    )
                  : CircularProgressCustom();
          }
        }));
  }
}

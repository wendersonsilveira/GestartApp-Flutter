import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/recebimento/pagamento_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_pagamentos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/di/di.dart';

class RecebimentoDetalhesPage extends StatefulWidget {
  final title;
  final Map<String, dynamic> filtro;
  final int codOrd;
  const RecebimentoDetalhesPage({Key key, this.title = 'Detalhes do recebimento', this.filtro, this.codOrd}) : super(key: key);

  @override
  _RecebimentoDetalhesPageState createState() => _RecebimentoDetalhesPageState();
}

class _RecebimentoDetalhesPageState extends State<RecebimentoDetalhesPage> {
  final _getPagamento = getIt.get<GetPagamentosUseCase>();
  List<PagamentoEntity> pagamentos = [];

  double total = 0;

  @override
  void initState() {
    getRecebimentosPro();
    super.initState();
  }

  getRecebimentosPro() async {
    var f = widget.filtro;
    f['CODORD'] = widget.codOrd;

    ResourceData r = await _getPagamento(widget.filtro);
    for (PagamentoEntity p in r.data) {
      total += p.valPag;
    }
    setState(() {
      pagamentos = r.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: pagamentos.length > 0
          ? SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text('Unidade: ${pagamentos[0].unidade}'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: pagamentos
                          .map(
                            (e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(color: Colors.grey),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  child: Text(e.histor),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  child: Text('Vencimento: ${UIHelper.formatDate(e.datVen)}'),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  child: Text('Data pagamento: ${UIHelper.formatDate(e.datPag)}'),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  child: Text(
                                    'Valor: ${UIHelper.moneyFormat(e.valPag)}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(padding: EdgeInsets.symmetric(horizontal: 5), child: Divider(color: Colors.grey)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text(
                          UIHelper.moneyFormat(total),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : CircularProgressCustom(),
    );
  }
}

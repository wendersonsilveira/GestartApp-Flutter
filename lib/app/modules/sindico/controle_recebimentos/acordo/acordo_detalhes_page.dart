import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/acrodo_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_acordo_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';

class AcordoDetalhesPage extends StatefulWidget {
  final int numAco;
  const AcordoDetalhesPage({Key key, this.numAco}) : super(key: key);

  @override
  _AcordoDetalhesPageState createState() => _AcordoDetalhesPageState();
}

class _AcordoDetalhesPageState extends State<AcordoDetalhesPage> {
  final _getAcordo = getIt.get<GetAcordoUseCase>();
  List<AcordoEntity> acordos = [];
  List<AcordoEntity> parcelamento;
  List<AcordoEntity> negociacao;
  AcordoEntity acordo;

  @override
  void initState() {
    getAcordo();
    super.initState();
  }

  getAcordo() async {
    ResourceData r = await _getAcordo(widget.numAco);

    setState(() {
      acordos = r.data;
      acordo = acordos[0];
      parcelamento = acordos.where((element) => element.isTaxaParcela).toList();
      negociacao = acordos.where((element) => element.isTaxaOriginal).toList();
    });
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.green[600],
        labelColor: Colors.green[600],
        tabs: [
          Tab(
            child: Text(
              'SOBRE',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'PARCELAMENTO',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'TAXAS NEGOCIADAS',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(
          context,
          title: Text(acordo != null ? 'Acordo N° ${acordo.numAco}' : 'Carregando acordo...'),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(children: [
          acordo != null
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Unidade:', style: TextStyle(fontWeight: FontWeight.bold)), Text(acordo.codImo)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Proprietário(a):', style: TextStyle(fontWeight: FontWeight.bold)),
                          Expanded(child: Text(acordo.nomPro, softWrap: true, textAlign: TextAlign.right))
                        ],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Tipo:', style: TextStyle(fontWeight: FontWeight.bold)), Text(acordo.tipAcoDescri, softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Data do acordo:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.formatDate(acordo.datAco), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Valor taxas:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.moneyFormat(acordo.valTax), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Valor multa:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.moneyFormat(acordo.valMul), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Valor juros:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.moneyFormat(acordo.valJur), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Outros valores:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.moneyFormat(acordo.valOut), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Valor desconto:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.moneyFormat(acordo.valDes), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total da dívida:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(UIHelper.moneyFormat((acordo.valTax + acordo.valMul + acordo.valJur + acordo.valOut) - acordo.valDes).toString(), softWrap: true)
                        ],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Valor entrada:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.moneyFormat(acordo.valEnt), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Parcelas:', style: TextStyle(fontWeight: FontWeight.bold)), Text(acordo.totPar.toString(), softWrap: true)],
                      ),
                      Divider(color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Saldo devedor:', style: TextStyle(fontWeight: FontWeight.bold)), Text(UIHelper.moneyFormat(acordo.saldoDevedor), softWrap: true)],
                      ),
                    ],
                  ),
                )
              : CircularProgressCustom(),
          parcelamento == null
              ? CircularProgressCustom()
              : parcelamento.length > 0
                  ? SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: parcelamento
                              .map((e) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.histor,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text('VENCIMENTO: ${UIHelper.formatDate(e.datVen)}'),
                                      Text('VALOR: ${UIHelper.moneyFormat(e.valMen)}'),
                                      e.isPago
                                          ? Text('PAGO EM: ${UIHelper.formatDate(e.datPag)}', style: TextStyle(color: Colors.green))
                                          : Text('EM ABERTO', style: TextStyle(color: Colors.blue)),
                                      Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  : Container(padding: EdgeInsets.all(25), child: Text('Nada para exibir', textAlign: TextAlign.center)),
          negociacao == null
              ? CircularProgressCustom()
              : negociacao.length > 0
                  ? SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: negociacao
                              .map((e) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.histor,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text('VENCIMENTO: ${UIHelper.formatDate(e.datVen)}'),
                                      Text('VALOR: ${UIHelper.moneyFormat(e.valMen)}'),
                                      Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  : Container(padding: EdgeInsets.all(25), child: Text('Nada para exibir', textAlign: TextAlign.center)),
        ]),
      ),
    );
  }
}

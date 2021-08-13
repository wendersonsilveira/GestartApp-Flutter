import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_historico_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_historico_inadim_use_case.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencia_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';

class InadimplenciaDetalhesPage extends StatefulWidget {
  final Map<String, dynamic> filtro;
  final int codOrd;
  const InadimplenciaDetalhesPage({Key key, this.filtro, this.codOrd})
      : super(key: key);

  @override
  _InadimplenciaDetalhesPageState createState() =>
      _InadimplenciaDetalhesPageState();
}

class _InadimplenciaDetalhesPageState extends State<InadimplenciaDetalhesPage> {
  final _getInadimplencias = getIt.get<GetInadimplenciaUseCase>();
  final _getHistoricos = getIt.get<GetHistoricoInadimUseCase>();
  List<InadimplenciaEntity> inadimplencia = [];
  List<HistoricoInadimEntity> historicos = [];
  Map<String, dynamic> filtro;
  double total = 0;

  void initState() {
    filtro = widget.filtro;
    filtro['CODORD'] = widget.codOrd;
    getInadimplencia();
    getHistoricos();
    super.initState();
  }

  getHistoricos() async {
    ResourceData r = await _getHistoricos(widget.codOrd);
    setState(() {
      historicos = r.data;
    });
  }

  getInadimplencia() async {
    ResourceData r = await _getInadimplencias(filtro);

    for (InadimplenciaEntity t in r.data) {
      total += t.total;
    }

    setState(() {
      inadimplencia = r.data;
      total = total;
    });
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.green[600],
        labelColor: Colors.green[600],
        tabs: [
          Tab(
            text: 'TAXA',
          ),
          Tab(
            text: 'HISTÓRICO',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(
          context,
          title: Text('Detalhes inadimplência'),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            inadimplencia.length > 0
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 5, bottom: 10, top: 20),
                          child: Text(
                            'Unidade: ${inadimplencia[0].unidade}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: inadimplencia
                                .map(
                                  (e) => Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(height: 22, color: Colors.grey),
                                        Text(e.histor),
                                        Text(
                                            'Vencimento: ${UIHelper.formatDate(e.datVen)}'),
                                        Text(
                                          'Valor: ${UIHelper.moneyFormat(e.total)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total:'),
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
            SingleChildScrollView(
              child: historicos.length > 0
                  ? Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: historicos
                            .map(
                              (e) => Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.event),
                                        Text(
                                            e.datemi != null
                                                ? UIHelper.formatDate(e.datemi)
                                                : 'Sem data',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Text(
                                      e.historico,
                                      softWrap: true,
                                    ),
                                    Divider(height: 25, color: Colors.grey)
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : CircularProgressCustom(),
            ),
          ],
        ),
      ),
    );
  }
}

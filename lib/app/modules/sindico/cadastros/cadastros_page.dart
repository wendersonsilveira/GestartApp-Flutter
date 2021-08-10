import 'package:Gestart/app/modules/sindico/graficos/pie_chart_graph.dart';
import 'package:Gestart/app/modules/sindico/graficos/pie_chart_model.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastros_controller.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/filtro_unidade_widget.dart';

class CadastrosPage extends StatefulWidget {
  final String title;
  const CadastrosPage({Key key, this.title = "Cadastros"}) : super(key: key);

  @override
  _CadastrosPageState createState() => _CadastrosPageState();
}

class _CadastrosPageState extends ModularState<CadastrosPage, CadastrosController> {
  bool isExpanded = false;
  List<Map<String, dynamic>> items = [
    {'title': 'Teste'},
    {'title': 'Teste'}
  ];

  Map<String, dynamic> filtro = {
    "FILTER_IS_USER": null,
    "FILTER_HAS_INQUILINO": null,
    "FILTER_HAS_PETS": null,
    "FILTER_HAS_VEICULOS": null,
    "FILTER_ARGUMENTO": null,
  };

  @override
  void initState() {
    super.initState();
    controller.getResumo().then((value) {
      controller.getUnidades(filtro);
    });
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.green[600],
        labelColor: Colors.green[600],
        tabs: [
          Tab(
            text: 'RESUMO',
          ),
          Tab(
            text: 'DETALHAMENTO',
          ),
        ],
      );

  Future<void> getFiltro() async {
    return showDialog(
      context: context,
      child: SimpleDialog(
        contentPadding: EdgeInsets.all(20),
        children: [
          FiltroUnidadeWdget(
            onSubmit: (filtter) {
              print(filtter);
              Modular.navigator.pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(
          context,
          actions: [TextButton(onPressed: getFiltro, child: Text('FILTRO'))],
          title: Text('Detalhes inadimplência'),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: Observer(
          builder: (_) => TabBarView(
            children: [
              controller.resumo == null
                  ? CircularProgressCustom()
                  : SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FlutterIcons.users_fea,
                                                color: AppColorScheme.primaryColor,
                                                size: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 3),
                                                child: Text('Total de unidades'),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: Text(controller.resumo.unidade.toString()),
                                          ),
                                          Text('Correspondente ao condomínio ${controller.resumo.nomcon}', style: TextStyle(color: Colors.black54)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(Icons.chevron_right),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                                    child: Card(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: AppColorScheme.primaryColor,
                                            ),
                                            Text('Ativos:'),
                                            Text(controller.resumo.isUser.toString(), style: TextStyle(color: Colors.black54)),
                                            Text('Usuários do GestartApp', style: TextStyle(color: Colors.black54), textAlign: TextAlign.center)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Card(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.close,
                                              color: AppColorScheme.feedbackDangerDark,
                                            ),
                                            Text('Potencial:'),
                                            Text((controller.resumo.unidade - controller.resumo.isUser).toString(), style: TextStyle(color: Colors.black54)),
                                            Text('Não usam o GestartApp', style: TextStyle(color: Colors.black54), textAlign: TextAlign.center)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                                    child: Card(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: AppColorScheme.primaryColor,
                                            ),
                                            Text('Inquilinos:'),
                                            Text(controller.resumo.asInquilino.toString(), style: TextStyle(color: Colors.black54)),
                                            Text('Total de inquilinos', style: TextStyle(color: Colors.black54), textAlign: TextAlign.center)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              child: ExpansionTile(
                                title: Text('Ver mais'),
                                children: [
                                  Divider(height: 5, color: Colors.grey),
                                  ListTile(
                                    leading: Icon(Icons.pets),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('Pets')),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: AppColorScheme.primaryColor,
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                          child: Text(
                                            controller.resumo.pets.toString(),
                                            style: TextStyle(fontSize: 12, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                  Container(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(height: 5, color: Colors.grey)),
                                  ListTile(
                                    leading: Icon(FlutterIcons.car_alt_faw5s),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('Veículos')),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: AppColorScheme.primaryColor,
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                          child: Text(
                                            controller.resumo.veiculos.toString(),
                                            style: TextStyle(fontSize: 12, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Text('Taxa de impacto:'),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Sua taxa de impacto pelo GestartApp. Quanto mais usuários melhor.',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            Container(
                              child: BarChartGraph(
                                horizontalFirst: true,
                                data: [
                                  BarChartModel(
                                    descricao: 'Usuários tivos',
                                    valor: controller.resumo.isUser.toDouble(),
                                    color: charts.ColorUtil.fromDartColor(AppColorScheme.primaryColor),
                                  ),
                                  BarChartModel(
                                    descricao: 'Potenciais usuários',
                                    valor: (controller.resumo.unidade - controller.resumo.isUser).toDouble(),
                                    color: charts.ColorUtil.fromDartColor(AppColorScheme.feedbackDangerDark),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      items.length > 0
                          ? Card(
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        childAspectRatio: 5,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: List.generate(
                                            items.length,
                                            (index) => Chip(
                                                  label: Text(items[index]['title']),
                                                  onDeleted: () => {print('Deleted')},
                                                )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      Card(
                        child: Column(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

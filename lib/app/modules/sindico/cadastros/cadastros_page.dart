import 'package:Gestart/app/modules/sindico/cadastros/detalhes/detalhes_page.dart';
import 'package:Gestart/app/modules/sindico/graficos/pie_chart_graph.dart';
import 'package:Gestart/app/modules/sindico/graficos/pie_chart_model.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastros_controller.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'components/filtro_unidade_widget.dart';

class CadastrosPage extends StatefulWidget {
  final String title;
  const CadastrosPage({Key key, this.title = "Cadastros"}) : super(key: key);

  @override
  _CadastrosPageState createState() => _CadastrosPageState();
}

class _CadastrosPageState
    extends ModularState<CadastrosPage, CadastrosController>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  List<Map<String, dynamic>> items = [];
  TabController _tabController;

  Map<String, dynamic> filtro = {
    "FILTER_IS_USER": null,
    "FILTER_HAS_INQUILINO": null,
    "FILTER_HAS_PETS": null,
    "FILTER_HAS_VEICULOS": null,
    "FILTER_ARGUMENTO": null,
    "FILTER_OFFSET": 0,
    "FILTER_LIMIT": 10,
  };

  ScrollController _scrollController = new ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    controller.getResumo().then((value) {
      controller.getUnidades(filtro);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!controller.finalList) {
          filtro['FILTER_OFFSET'] += 10;
          controller.getNexFilterUnidades(filtro);
        }
      }
    });
  }

  getTagFilter(List<Map<String, dynamic>> filter) {
    setState(() {
      items = filter;
    });
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.green[600],
        labelColor: Colors.green[600],
        controller: _tabController,
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
            getHeader: getTagFilter,
            filtro: filtro,
            onSubmit: (filtter) {
              controller.getUnidades(filtro);
              Modular.navigator.pop();
            },
          ),
        ],
      ),
    );
  }

  cleanFilter() {
    filtro = {
      "FILTER_IS_USER": null,
      "FILTER_HAS_INQUILINO": null,
      "FILTER_HAS_PETS": null,
      "FILTER_HAS_VEICULOS": null,
      "FILTER_ARGUMENTO": null,
      "FILTER_OFFSET": 0,
      "FILTER_LIMIT": 10,
    };
    items = [];

    controller.getUnidades(filtro);
  }

  removeFilterItem(String key) {
    filtro[key] = null;
    controller.getUnidades(filtro);
    setState(() {
      items = items.where((element) => element['key'] != key).toList();
    });
  }

  mudarPage(int index) {
    setState(() {
      _tabController.animateTo(index,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
    controller.getUnidades(filtro);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustom(
          context,
          title: Text('Cadastros de unidades'),
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
            controller: _tabController,
            children: [
              controller.resumo == null
                  ? CircularProgressCustom()
                  : SingleChildScrollView(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FlutterIcons.users_fea,
                                                color:
                                                    AppColorScheme.primaryColor,
                                                size: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3),
                                                child:
                                                    Text('Total de unidades'),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(controller
                                                .resumo.unidade
                                                .toString()),
                                          ),
                                          Text(
                                              'Correspondente ao condomínio ${controller.resumo.nomcon}',
                                              style: TextStyle(
                                                  color: Colors.black54)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(Icons.chevron_right),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 5, right: 5, bottom: 5),
                                    child: Card(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color:
                                                  AppColorScheme.primaryColor,
                                            ),
                                            Text('Ativos:'),
                                            Text(
                                                controller.resumo.isUser
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                            Text('Usuários do GestartApp',
                                                style: TextStyle(
                                                    color: Colors.black54),
                                                textAlign: TextAlign.center)
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
                                              color: AppColorScheme
                                                  .feedbackDangerDark,
                                            ),
                                            Text('Potencial:'),
                                            Text(
                                                (controller.resumo.unidade -
                                                        controller
                                                            .resumo.isUser)
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                            Text('Não usam o GestartApp',
                                                style: TextStyle(
                                                    color: Colors.black54),
                                                textAlign: TextAlign.center)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 5, bottom: 5),
                                    child: Card(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color:
                                                  AppColorScheme.primaryColor,
                                            ),
                                            Text('Inquilinos:'),
                                            Text(
                                                controller.resumo.asInquilino
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                            Text('Total de inquilinos',
                                                style: TextStyle(
                                                    color: Colors.black54),
                                                textAlign: TextAlign.center)
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
                                    onTap: () {
                                      filtro['FILTER_HAS_PETS'] = 1;
                                      mudarPage(1);
                                    },
                                    leading: Icon(Icons.pets),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('Pets')),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: AppColorScheme.primaryColor,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 4),
                                          child: Text(
                                            controller.resumo.pets.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Divider(
                                          height: 5, color: Colors.grey)),
                                  ListTile(
                                    onTap: () {
                                      filtro['FILTER_HAS_VEICULOS'] = 1;
                                      mudarPage(1);
                                    },
                                    leading: Icon(FlutterIcons.car_alt_faw5s),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('Veículos')),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: AppColorScheme.primaryColor,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 4),
                                          child: Text(
                                            controller.resumo.veiculos
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
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
                              padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
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
                                    color: charts.ColorUtil.fromDartColor(
                                        AppColorScheme.primaryColor),
                                  ),
                                  BarChartModel(
                                    descricao: 'Potenciais usuários',
                                    valor: (controller.resumo.unidade -
                                            controller.resumo.isUser)
                                        .toDouble(),
                                    color: charts.ColorUtil.fromDartColor(
                                        AppColorScheme.feedbackDangerDark),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text('Filtros')),
                                ),
                                Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: cleanFilter,
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.filter_list,
                                      color: AppColorScheme.primaryColor,
                                    ),
                                    onPressed: getFiltro,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: items.length > 0
                                      ? GridView.count(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 2,
                                          childAspectRatio: 5,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          children: List.generate(
                                              items.length,
                                              (index) => Chip(
                                                    label: Text(
                                                        items[index]['title']),
                                                    onDeleted: () =>
                                                        removeFilterItem(
                                                            items[index]
                                                                ['key']),
                                                  )),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    controller.isLoading
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                filtro['FILTER_OFFSET'] = 0;
                                controller.getUnidades(filtro);
                              },
                              child:
                                  controller.unidades != null &&
                                          controller.unidades.length > 0
                                      ? ListView.builder(
                                          controller: _scrollController,
                                          itemCount: controller.isLoadingNex &&
                                                  !controller.finalList
                                              ? controller.unidades.length + 1
                                              : controller.unidades.length,
                                          itemBuilder: (_, index) {
                                            return index ==
                                                        controller
                                                            .unidades.length &&
                                                    !controller.finalList
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child:
                                                        CircularProgressCustom(),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetalhesPage(
                                                            codOrd: controller
                                                                .unidades[index]
                                                                .codord,
                                                            condonUserId:
                                                                controller
                                                                    .unidades[
                                                                        index]
                                                                    .condonUserId,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Card(
                                                      margin: EdgeInsets.only(
                                                          top: 8),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      'Unidade: ${controller.unidades[index].codimo}'),
                                                                  Text(
                                                                      'Proprietário: ${controller.unidades[index].nompro}'),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            12),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        controller.unidades[index].isUser !=
                                                                                0
                                                                            ? Text('USUÁRIO ATIVO',
                                                                                style: TextStyle(color: AppColorScheme.primaryColor))
                                                                            : Text('NÃO É USUÁRIO', style: TextStyle(color: Colors.red)),
                                                                        controller.unidades[index].asInquilino >
                                                                                0
                                                                            ? Text(
                                                                                'TEM INQUILINO',
                                                                                style: TextStyle(
                                                                                  color: AppColorScheme.primaryColor,
                                                                                ),
                                                                              )
                                                                            : Text(
                                                                                'NÂO TEM INQUILO',
                                                                                style: TextStyle(color: Colors.red),
                                                                              ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.only(right: 8),
                                                                                child: Icon(Icons.pets, color: AppColorScheme.primaryColor),
                                                                              ),
                                                                              Text(
                                                                                '${controller.unidades[index].pets} PETS',
                                                                                style: TextStyle(fontSize: 13),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.only(right: 8),
                                                                                child: Icon(FlutterIcons.car_alt_faw5s, color: AppColorScheme.primaryColor),
                                                                              ),
                                                                              Text(
                                                                                '${controller.unidades[index].veiculos} VEÍCULOS',
                                                                                style: TextStyle(fontSize: 13, color: Colors.black54),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: Icon(Icons
                                                                  .chevron_right),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                          },
                                        )
                                      : EmptyWidget(
                                          descricao:
                                              "Nem um resultado correspondente ao filtro.",
                                        ),
                            ),
                          )
                        : Expanded(child: CircularProgressCustom()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

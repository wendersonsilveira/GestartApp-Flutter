import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'contas_fixas_controller.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/contas/contas_entity.dart';
import 'package:Gestart/app/modules/sindico/graficos/pie_chart_graph.dart';

class ContasFixasPage extends StatefulWidget {
  final String title;
  const ContasFixasPage({Key key, this.title = "Contas Fixas"})
      : super(key: key);

  @override
  _ContasFixasPageState createState() => _ContasFixasPageState();
}

class _ContasFixasPageState
    extends ModularState<ContasFixasPage, ContasFixasController> {
  List<ContasEntity> contas = [];

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  List<ContasEntity> getContas(ContasEntity e) {
    var a = controller.contas.data
        .where((element) => element.nomCla == e.nomCla)
        .toList();
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          switch (controller.contas.status) {
            case Status.loading:
              return CircularProgressCustom();
              break;
            case Status.success:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: controller.tipos.map((e) {
                          return Card(
                            margin: EdgeInsets.only(top: 12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 30,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          color: Colors.grey[350],
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    120,
                                                child: Text(
                                                  '${e.nomCla}',
                                                  softWrap: true,
                                                ),
                                              ),
                                              Text(UIHelper.moneyFormat(
                                                  e.totalCategoria)),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                    children: getContas(e).map((e) {
                                  return Card(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ListTile(
                                            title: e.nomFor != null
                                                ? Text(e.nomFor)
                                                : Text(e.nomPla),
                                            subtitle: e.nomFor != null
                                                ? e.nomPla != null
                                                    ? Text(e.nomPla)
                                                    : null
                                                : null,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  Text('VALOR'),
                                                  Text(UIHelper.moneyFormat(
                                                      e.valCon))
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text('DIA VCTO.'),
                                                  Text(e.diaVen.toString())
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text('MÉDIA'),
                                                  Text(e.valorMedia)
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList()),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 30,
                        color: Colors.grey[350],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TOTAL: '),
                              Text(UIHelper.moneyFormat(
                                  controller.totalCategorias))
                            ],
                          ),
                        ),
                      ),
                    ),
                    controller.data.length > 0
                        ? BarChartGraph(
                            data: controller.data,
                            horizontalFirst: true,
                          )
                        : CircularProgressCustom(),
                  ],
                ),
              );
            default:
              return Center(
                child: PageError(
                  messageError: "Erro ao carregar as informações",
                  onPressed: controller.init,
                ),
              );
          }
        },
      ),
    );
  }
}

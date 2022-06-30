import 'package:Gestart/app/modules/sindico/component/icon_status_helper_widget.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'lista_reservas_controller.dart';

class ListaReservasPage extends StatefulWidget {
  final String title;
  final SendParamsRelReservaEntity params;

  const ListaReservasPage(
      {Key key, this.title = "Lista de reservas", this.params})
      : super(key: key);

  @override
  _ListaReservasPageState createState() => _ListaReservasPageState();
}

class _ListaReservasPageState
    extends ModularState<ListaReservasPage, ListaReservasController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.params);
  }

  SendParamsRelReservaEntity params2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
          actions: [
            GestureDetector(
              onTap: () => {
                params2 = SendParamsRelReservaEntity(
                codCon: widget.params.codCon,
                codimo: widget.params.codimo,
                status: widget.params.status,
                espaco: widget.params.espaco,
                dataIni: widget.params.dataIni,
                dataFim: widget.params.dataFim,
                tipo: 'PDF'),
                controller.getReservasPDF(params2)
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(FlutterIcons.download_ant),
              ),
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            switch (controller.reservas.status) {
              case Status.loading:
                return Center(child: CircularProgressCustom());
                break;
              case Status.failed:
                return Center(
                    child: PageError(
                  messageError: 'Erro ao pesquisar reservas.',
                  onPressed: () => {controller.init(widget.params)},
                ));
                break;
              default:
                return Container(
                    child: controller.reservas.data.isEmpty
                        ? EmptyWidget(
                            descricao:
                                'Não foram identificadas reservas com esses parametros',
                          )
                        : ListView.builder(
                            itemCount: controller.reservas.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                margin: const EdgeInsets.only(
                                    top: 8, left: 4, right: 4),
                                child: ListTile(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Center(
                                                child:
                                                    Text('Dados da reserva')),
                                            content: Container(
                                              height: 250,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(controller
                                                        .reservas
                                                        .data[index]
                                                        .proprietario),
                                                    Divider(),
                                                    Text('Condomínio: ' +
                                                        controller.reservas
                                                            .data[index].apelido
                                                            .toString()),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text('Espaço: ' +
                                                        controller
                                                            .reservas
                                                            .data[index]
                                                            .espacoDescricao
                                                            .toString()),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text('Data: ' +
                                                        UIHelper
                                                            .formatDateFromDateTime(
                                                                controller
                                                                    .reservas
                                                                    .data[index]
                                                                    .data)),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text('Hora início: ' +
                                                        controller
                                                            .reservas
                                                            .data[index]
                                                            .horIniDescricao
                                                            .toString()),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text('Hora fim: ' +
                                                        controller
                                                            .reservas
                                                            .data[index]
                                                            .horFimDescricao
                                                            .toString()),
                                                  ]),
                                            ),
                                            actions: [
                                              FlatButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  Modular.navigator.pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    leading: IconStatusHelperWidget(
                                      status: controller
                                          .reservas.data[index].status,
                                    ),
                                    title: Text('Unidade: ' +
                                        controller.reservas.data[index].codimo
                                            .toString()),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.reservas.data[index]
                                            .espacoDescricao),
                                        Text('Data: ' +
                                            UIHelper.formatDateFromDateTime(
                                                controller.reservas.data[index]
                                                    .data)),
                                      ],
                                    )),
                              );
                            }));
            }
          },
        ));
  }
}

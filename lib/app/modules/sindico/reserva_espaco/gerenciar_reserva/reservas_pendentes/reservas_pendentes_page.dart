import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reservas_pendentes_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/app/utils/ui_helper.dart';

class ReservasPendentesPage extends StatefulWidget {
  final String title;
  const ReservasPendentesPage({Key key, this.title = "ReservasPendentes"})
      : super(key: key);

  @override
  _ReservasPendentesPageState createState() => _ReservasPendentesPageState();
}

class _ReservasPendentesPageState
    extends ModularState<ReservasPendentesPage, ReservasPendentesController> {
  //use 'controller' variable to access controller
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  aprovarReserva(reservaId) async {
    final result = await controller.aprovarReserva(reservaId);

    if (result.status == Status.success) {
      UIHelper.showInSnackBar(result.message, _scaffoldKey);
      controller.init();
    } else
      UIHelper.showInSnackBar(result.error.message, _scaffoldKey);
  }

  rejeitarReserva(reservaId) async {
    final result = await controller.rejeitarReserva(reservaId);

    if (result.status == Status.success) {
      UIHelper.showInSnackBar(result.message, _scaffoldKey);
      controller.init();
    } else
      UIHelper.showInSnackBar(result.error.message, _scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Observer(
            builder: (_) => controller.reservasAdm.status == Status.loading
                ? CircularProgressCustom()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 12, bottom: 16),
                        child: Text(
                          'RESERVAS AGUARDANDO APROVAÇÃO NA ORDEM EM QUE FORAM FEITAS.',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Divider(),
                      controller.reservasPendentes.length == 0
                          ? Center(
                              child: EmptyWidget(
                                descricao:
                                    'Sem reservas pendentes de aprovação!',
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: controller.reservasPendentes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.reservasPendentes[index].apelido} - ${controller.reservasPendentes[index].codimo}',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                            '${UIHelper.formatDate(controller.reservasPendentes[index].data)} | ${controller.reservasPendentes[index].horIniDescricao} - ${controller.reservasPendentes[index].horFimDescricao}'),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 10),
                                                onPressed: () {
                                                  aprovarReserva(controller
                                                      .reservasPendentes[index]
                                                      .id);
                                                },
                                                child: Text(
                                                  'APROVAR',
                                                  style: TextStyle(
                                                    color: AppColorScheme
                                                        .primaryColor,
                                                  ),
                                                ),
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  side: BorderSide(
                                                      color: AppColorScheme
                                                          .primaryColor,
                                                      width: 1),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0, horizontal: 5),
                                                onPressed: () {
                                                  rejeitarReserva(controller
                                                      .reservasPendentes[index]
                                                      .id);
                                                },
                                                child: Text(
                                                  'REJEITAR',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  side: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                                },
                              ),
                            )
                    ],
                  )));
  }
}

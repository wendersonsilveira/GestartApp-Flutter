import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhes_reserva_controller.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';

class DetalhesReservaPage extends StatefulWidget {
  final String title;
  // final ReservaEntity reserva;
  final int idReserva;
  const DetalhesReservaPage(
      {Key key, this.title = "Detalhes Reserva", this.idReserva})
      : super(key: key);

  @override
  _DetalhesReservaPageState createState() => _DetalhesReservaPageState();
}

class _DetalhesReservaPageState
    extends ModularState<DetalhesReservaPage, DetalhesReservaController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init(widget.idReserva);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  aprovarReserva(reservaId) async {
    final result = await controller.aprovarReserva(reservaId);

    if (result.status == Status.success) {
      UIHelper.showInSnackBar(result.message, _scaffoldKey);
      Timer(Duration(seconds: 2), () {
        Modular.navigator.pop();
      });
    } else
      UIHelper.showInSnackBar(result.error.message, _scaffoldKey);
  }

  rejeitarReserva(reservaId) async {
    final result = await controller.rejeitarReserva(reservaId);

    if (result.status == Status.success) {
      UIHelper.showInSnackBar(result.message, _scaffoldKey);
      Timer(Duration(seconds: 2), () {
        Modular.navigator.pop();
      });
    } else
      UIHelper.showInSnackBar(result.error.message, _scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          return controller.reserva.status == Status.loading
              ? CircularProgressCustom()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        title: Text('Unidade'),
                        subtitle: Text(
                            '${controller.reserva.data.apelido} - ${controller.reserva.data.codimo}'),
                      ),
                    ),
                    controller.reserva.data != null
                        ? Card(
                            child: ListTile(
                                title: Text('Espaço'),
                                subtitle: Text(
                                    '${controller.reserva.data.espacoDescricao}')),
                          )
                        : Container(),
                    Card(
                      child: ListTile(
                        title: Text('Data/Hora'),
                        subtitle: Text(
                            '${UIHelper.formatDate(controller.reserva.data.data)} | ${controller.reserva.data.horIniDescricao} - ${controller.reserva.data.horFimDescricao}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.reserva.data.status == 0
                          ? Text(
                              'PENDENTE APROVAÇÃO',
                              style: TextStyle(
                                  color: AppColorScheme.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          : controller.reserva.data.status == 1
                              ? Text(
                                  'APROVADA',
                                  style: TextStyle(
                                      color: AppColorScheme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              : Text(
                                  'REJEITADA',
                                  style: TextStyle(color: Colors.red),
                                ),
                    ),
                    if (controller.reserva.data.status == 0)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              onPressed: () {
                                aprovarReserva(widget.idReserva);
                              },
                              child: Text(
                                'APROVAR',
                                style: TextStyle(
                                  color: AppColorScheme.primaryColor,
                                ),
                              ),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                side: BorderSide(
                                    color: AppColorScheme.primaryColor,
                                    width: 1),
                              ),
                            ),
                            SizedBox(width: 15),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              onPressed: () {
                                rejeitarReserva(widget.idReserva);
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
                                    BorderRadius.all(Radius.circular(20)),
                                side: BorderSide(color: Colors.red, width: 1),
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                );
        }));
  }
}

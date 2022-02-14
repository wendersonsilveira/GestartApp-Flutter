import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reserva_controller.dart';

class ReservaPage extends StatefulWidget {
  final String title;
  const ReservaPage({Key key, this.title = "Reservas"}) : super(key: key);

  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends ModularState<ReservaPage, ReservaController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.getReservas();
    super.initState();
  }

  cancelarReserva(int id) async {
    final r = await controller.cancelarReserva(id);
    if (r.status == Status.success) {
      Modular.to.pop(true);

      openDialogInf(
          [
            TextButton(
              onPressed: () {
                controller.getReservas();
                Modular.to.pop();
              },
              child: const Text(
                'OK',
              ),
            )
          ],
          Container(
            child: Text(r.message),
          ),
          Text(
            'Sucesso',
          ));
    } else {
      Modular.to.pop(false);

      openDialogInf(
          [
            TextButton(
              onPressed: () => Modular.to.pop(),
              child: const Text(
                'OK',
              ),
            )
          ],
          Container(
            child: Text(r.message),
          ),
          Text(
            'Sucesso',
          ));
    }
  }

  openDialogInf(List<Widget> actions, Widget content, Widget title) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: title,
        content: content,
        actions: actions,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () {
              Modular.to
                  .pushNamed(RouteName.reservaUnidades)
                  .then((value) => controller.getReservas());
            },
            child: Text(
              'Criar',
              style: AppTextTheme.textActionButton,
            ),
          )
        ],
      ),
      body: Observer(
        builder: (_) => controller.reservas == null
            ? CircularProgressCustom()
            : controller.reservas.length == 0
                ? Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_busy,
                            size: 70,
                            color: AppColorScheme.primaryColor,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text('Não há reservas feitas.'),
                        ],
                      ),
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: controller.reservas.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                child: Dismissible(
                                  key: Key(
                                      controller.reservas[index].id.toString()),
                                  background: Container(
                                    color: AppColorScheme.tagRed2,
                                    child: Icon(
                                      Icons.delete,
                                      color: AppColorScheme.white,
                                    ),
                                  ),
                                  confirmDismiss:
                                      (DismissDirection direction) async {
                                    return showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text('Cancelar reserva'),
                                        content: Container(
                                          child: Text(
                                              'Deseja realmente cancelar sua reserva?'),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Modular.to.pop(),
                                            child: Text(
                                              'NÃO',
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              cancelarReserva(controller
                                                  .reservas[index].id);
                                            },
                                            child: Text('SIM'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: controller.reservas[index]
                                              .espacoDescricao !=
                                          null
                                      ? ListTile(
                                          title: Text(
                                            '${controller.reservas[index].espacoDescricao}\n${controller.reservas[index].apelido} - ${controller.reservas[index].codimo}\n${UIHelper.formatDate(controller.reservas[index].datIni)} | ${controller.reservas[index].horIniDescricao} - ${controller.reservas[index].horFimDescricao}',
                                            style: TextStyle(height: 1.5),
                                          ),
                                          subtitle: controller
                                                      .reservas[index].status ==
                                                  0
                                              ? Text(
                                                  'AGUARDANDO APROVAÇÃO',
                                                  style: TextStyle(
                                                      color: AppColorScheme
                                                          .textInfo,
                                                      height: 1.5),
                                                )
                                              : controller.reservas[index]
                                                          .status ==
                                                      1
                                                  ? Text(
                                                      'APROVADA',
                                                      style: TextStyle(
                                                          color: AppColorScheme
                                                              .primaryColor,
                                                          height: 1.5),
                                                    )
                                                  : Text(
                                                      'REJEITADA',
                                                      style: TextStyle(
                                                          color: AppColorScheme
                                                              .feedbackDangerDark,
                                                          height: 1.5),
                                                    ),
                                          trailing: Padding(
                                            padding: EdgeInsets.only(top: 14),
                                            child: Icon(
                                              Icons.arrow_right,
                                              size: 40,
                                            ),
                                          ),
                                          onTap: () => Modular.to
                                              .pushNamed(RouteName.reservaDados,
                                                  arguments: controller
                                                      .reservas[index].id)
                                              .then((value) =>
                                                  controller.getReservas()),
                                        )
                                      : ListTile(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Espaço excluido, entre em contato com seu síndico para mais informações',
                                                  style: TextStyle(
                                                      height: 1,
                                                      color: AppColorScheme
                                                          .feedbackDangerBase)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${controller.reservas[index].apelido} - ${controller.reservas[index].codimo}\n${UIHelper.formatDate(controller.reservas[index].datIni)} | ${controller.reservas[index].horIniDescricao} - ${controller.reservas[index].horFimDescricao}',
                                                style: TextStyle(height: 1.5),
                                              ),
                                            ],
                                          ),
                                          subtitle: controller
                                                      .reservas[index].status ==
                                                  0
                                              ? Text(
                                                  'AGUARDANDO APROVAÇÃO',
                                                  style: TextStyle(
                                                      color: AppColorScheme
                                                          .textInfo,
                                                      height: 1.5),
                                                )
                                              : controller.reservas[index]
                                                          .status ==
                                                      1
                                                  ? Text(
                                                      'APROVADA',
                                                      style: TextStyle(
                                                          color: AppColorScheme
                                                              .primaryColor,
                                                          height: 1.5),
                                                    )
                                                  : Text(
                                                      'REJEITADA',
                                                      style: TextStyle(
                                                          color: AppColorScheme
                                                              .feedbackDangerDark,
                                                          height: 1.5),
                                                    ),
                                        ),
                                ),
                              ),
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

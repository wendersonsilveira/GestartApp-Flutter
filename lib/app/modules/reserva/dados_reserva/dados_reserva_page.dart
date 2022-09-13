import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dados_reserva_controller.dart';

class DadosReservaPage extends StatefulWidget {
  final String title;
  final ReservaEntity reserva;
  final int idReserva;

  const DadosReservaPage(
      {Key key, this.title = "Dados da reserva", this.reserva, this.idReserva})
      : super(key: key);

  @override
  _DadosReservaPageState createState() => _DadosReservaPageState();
}

class _DadosReservaPageState
    extends ModularState<DadosReservaPage, DadosReservaController> {
  //use 'controller' variable to access controller
  ReservaEntity reserva;
  cancelarReserva() async {
    final r = await controller.cancelarReserva(widget.idReserva);
    Modular.navigator.pop();
    if (r.status == Status.success) {
      openDialogInf(
          [
            TextButton(
              onPressed: () => Navigator.popUntil(
                  context, ModalRoute.withName(RouteName.reservas)),
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
      openDialogInf(
          [
            TextButton(
              onPressed: () => Modular.navigator.pop(),
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

  confirmCancelar() {
    openDialogInf(
        [
          TextButton(
            onPressed: () => Modular.navigator.pop(),
            child: const Text(
              'NÃO',
            ),
          ),
          TextButton(
            onPressed: () {
              cancelarReserva();
            },
            child: const Text('SIM'),
          ),
        ],
        Container(
          child: Text('Deseja realmente cancelar sua reserva?'),
        ),
        Text('Cancelar reserva'));
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
  void initState() {
    controller.init(widget.idReserva);
    reserva = controller.reserva.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      // body: Text('teste'),
      body: Observer(builder: (_) {
        switch (controller.reserva.status) {
          case Status.loading:
            return CircularProgressCustom();
            break;
          case Status.success:
            return Observer(builder: (_) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Unidade'),
                    subtitle: Text(
                        '${controller.reserva.data.apelido} - ${controller.reserva.data.codimo}'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 5,
                      color: Color(0xFFA3A3A3),
                    ),
                  ),
                  ListTile(
                    title: Text('Espaço'),
                    subtitle: Text(controller.reserva.data.espacoDescricao),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 5,
                      color: Color(0xFFA3A3A3),
                    ),
                  ),
                  ListTile(
                    title: Text('Data/Hora'),
                    subtitle: Text(
                        '${UIHelper.formatDate(controller.reserva.data.datIni)} | ${controller.reserva.data.horIniDescricao} - ${controller.reserva.data.horFimDescricao}'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 5,
                      color: Color(0xFFA3A3A3),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: controller.reserva.data.status == 0
                        ? Text(
                            'AGUARDANDO APROVAÇÃO',
                            style: TextStyle(
                                color: AppColorScheme.textInfo, height: 1.5),
                          )
                        : controller.reserva.data.status == 1
                            ? Text(
                                'APROVADA',
                                style: TextStyle(
                                    color: AppColorScheme.primaryColor,
                                    height: 1.5),
                              )
                            : Text(
                                'REJEITADA',
                                style: TextStyle(
                                    color: AppColorScheme.primaryColor,
                                    height: 1.5),
                              ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: RaisedButton(
                            child: Text(
                              'CANCELAR',
                              style: TextStyle(color: Color(0xFFFFFFFF)),
                            ),
                            color: AppColorScheme.feedbackDangerBase,
                            padding: EdgeInsets.symmetric(vertical: 2),
                            onPressed: () {
                              if (controller.reserva.data.datIni
                                  .isAfter(DateTime.now())) {
                                confirmCancelar();
                              } else {
                                return showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('Cancelamento não autorizado'),
                                    content: Text(
                                        'Prazo para cancelamento expirado. Contate o síndico para mais informações.'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            });
          default:
            return Center(
              child: PageError(
                messageError: 'Erro ao carregar a pagina',
              ),
            );
        }
      }),
    );
  }
}

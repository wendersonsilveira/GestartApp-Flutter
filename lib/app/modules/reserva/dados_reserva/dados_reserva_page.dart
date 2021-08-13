import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dados_reserva_controller.dart';

class DadosReservaPage extends StatefulWidget {
  final String title;
  final ReservaEntity reserva;

  const DadosReservaPage(
      {Key key, this.title = "Dados da reserva", this.reserva})
      : super(key: key);

  @override
  _DadosReservaPageState createState() => _DadosReservaPageState();
}

class _DadosReservaPageState
    extends ModularState<DadosReservaPage, DadosReservaController> {
  //use 'controller' variable to access controller
  cancelarReserva() async {
    final r = await controller.cancelarReserva(widget.reserva.id);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Unidade'),
            subtitle:
                Text('${widget.reserva.apelido} - ${widget.reserva.codimo}'),
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
            subtitle: Text(widget.reserva.espacoDescricao),
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
                '${widget.reserva.datIni} | ${widget.reserva.horIniDescricao} - ${widget.reserva.horFimDescricao}'),
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
            child: widget.reserva.status == 0
                ? Text(
                    'AGUARDANDO APROVAÇÃO',
                    style:
                        TextStyle(color: AppColorScheme.textInfo, height: 1.5),
                  )
                : widget.reserva.status == 1
                    ? Text(
                        'APROVADA',
                        style: TextStyle(
                            color: AppColorScheme.primaryColor, height: 1.5),
                      )
                    : Text(
                        'REJEITADA',
                        style: TextStyle(
                            color: AppColorScheme.primaryColor, height: 1.5),
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
                      confirmCancelar();
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhes_reserva_controller.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';

class DetalhesReservaPage extends StatefulWidget {
  final String title;
  final ReservaEntity reserva;
  const DetalhesReservaPage(
      {Key key, this.title = "Detalhes Reserva", this.reserva})
      : super(key: key);

  @override
  _DetalhesReservaPageState createState() => _DetalhesReservaPageState();
}

class _DetalhesReservaPageState
    extends ModularState<DetalhesReservaPage, DetalhesReservaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Unidade'),
              subtitle:
                  Text('${widget.reserva.apelido} - ${widget.reserva.codimo}'),
            ),
          ),
          widget.reserva.espacoDescricao != null
              ? Card(
                  child: ListTile(
                      title: Text('Espaço'),
                      subtitle: Text('${widget.reserva.espacoDescricao}')),
                )
              : Container(),
          Card(
            child: ListTile(
              title: Text('Data/Hora'),
              subtitle: Text(
                  '${UIHelper.formatDate(widget.reserva.data)} | ${widget.reserva.horIniDescricao} - ${widget.reserva.horFimDescricao}'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.reserva.status == 1
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
        ],
      ),
    );
  }
}

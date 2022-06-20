import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';
import 'package:flutter/material.dart';
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
    print(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
        ),
        body: Container(
          child: Text('teste'),
        ));
  }
}

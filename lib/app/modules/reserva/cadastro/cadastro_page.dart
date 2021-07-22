import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/button_submit_primary_widget.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro", this.reserva}) : super(key: key);
  final dynamic reserva;
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends ModularState<CadastroPage, CadastroController> {
  @override
  void initState() {
    super.initState();
  }

  reservar() async {
    final r = await controller.cadastarReserva(widget.reserva);

    if (r.status == Status.success) {
      Modular.navigator.pop();
      statusReserva('Sucesso', r.message, true);
    } else {
      statusReserva('Falha', r.message, false);
    }
  }

  confirmarReserva() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Reserva de espaço'),
        content: Container(
          height: 50,
          child: Column(
            children: [Text('Confirmar reserva?')],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Modular.navigator.pop(),
            child: const Text('CANCELAR'),
          ),
          TextButton(
            onPressed: () => reservar(),
            child: const Text('CONCORDO'),
          ),
        ],
      ),
    );
  }

  statusReserva(String title, String info, bool success) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: success ? AppColorScheme.primaryColor : AppColorScheme.feedbackDangerBase),
        ),
        content: Container(
          height: 50,
          child: Column(
            children: [Text(info)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (success) {
                goToReservas();
              } else {
                Modular.navigator.pop();
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  goToReservas() {
    Navigator.popUntil(context, ModalRoute.withName(RouteName.reservas));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
            child: Text(
              'Verifique se todos os dados estão corretos e confirme sua reserva.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Divider(
              height: 5,
              color: Color(0xFFB1B1B1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: Text(
                'Unidade',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                '${widget.reserva['APELIDO']} - ${widget.reserva['CODORD']}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Divider(
              height: 5,
              color: Color(0xFFB1B1B1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: Text(
                'Espaço',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                widget.reserva['ESPACO_DESCRICAO'],
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Divider(
              height: 5,
              color: Color(0xFFB1B1B1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: Text(
                'Data/Hora',
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                '${UIHelper.formatDateFromString(widget.reserva['DATINI'])} | ${widget.reserva['HORINI_DESCRICAO']} - ${widget.reserva['HORFIM_DESCRICAO']}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ButtonSubmitPrimaryWidget(
                descricao: 'RESERVAR',
                funcao: confirmarReserva,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

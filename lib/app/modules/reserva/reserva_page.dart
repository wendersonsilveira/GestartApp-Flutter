import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reserva_controller.dart';

class ReservaPage extends StatefulWidget {
  final String title;
  const ReservaPage({Key key, this.title = "Reserva"}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () =>
                Modular.navigator.pushNamed(RouteName.reservaUnidades),
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
                                child: ListTile(
                                  title: Text(
                                    '${controller.reservas[index].espacoDescricao}\n${controller.reservas[index].apelido} - ${controller.reservas[index].codimo}\n${UIHelper.formatDate(controller.reservas[index].datIni)} | ${controller.reservas[index].horIniDescricao} - ${controller.reservas[index].horFimDescricao}',
                                    style: TextStyle(height: 1.5),
                                  ),
                                  subtitle: Text(
                                    'AGUARDANDO APROVAÇÃO',
                                    style: TextStyle(
                                        color: AppColorScheme.textInfo,
                                        height: 1.5),
                                  ),
                                  trailing: Padding(
                                    padding: EdgeInsets.only(top: 14),
                                    child: Icon(
                                      Icons.arrow_right,
                                      size: 40,
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

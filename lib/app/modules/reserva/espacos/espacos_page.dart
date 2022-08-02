import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'espacos_controller.dart';

class EspacosPage extends StatefulWidget {
  final String title;
  final int codcon;
  final int codord;
  const EspacosPage({
    Key key,
    this.title = "Nova reserva - Espaços",
    this.codcon,
    this.codord,
  }) : super(key: key);

  @override
  _EspacosPageState createState() => _EspacosPageState();
}

class _EspacosPageState extends ModularState<EspacosPage, EspacosController> {
  @override
  void initState() {
    controller.getEspacos(widget.codcon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => controller.espacos.length == 0
            ? Container(child: EmptyWidget(descricao: 'Não há espaços cadastrados nesse condomínio.'),)
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text(
                      'Selecione o espaço a ser reservado',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: controller.espacos.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: ListTile(
                            title: Text(controller.espacos[index].descricao.trim()),
                            subtitle: Text(
                                'Capacidade: ${controller.espacos[index].capacidade} pessoas.\n${controller.espacos[index].aprovacao ? 'REQUER APROVAÇÃO' : 'NÃO REQUER APROVAÇÃO'}'),
                            leading: Icon(
                              FlutterIcons.square_faw,
                              color: AppColorScheme.primaryColor,
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              size: 40,
                            ),
                            onTap: () => Modular.navigator.pushNamed(RouteName.reservaHorarios, arguments: [controller.espacos[index].id, widget.codord]),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

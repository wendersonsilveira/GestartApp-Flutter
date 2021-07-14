import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'unidades_controller.dart';

class UnidadesPage extends StatefulWidget {
  final String title;
  const UnidadesPage({Key key, this.title = "Nova reserva - Unidades"}) : super(key: key);

  @override
  _UnidadesPageState createState() => _UnidadesPageState();
}

class _UnidadesPageState extends ModularState<UnidadesPage, UnidadesController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.getUnidades();
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
        builder: (_) => controller.unidades.length == 0
            ? CircularProgressCustom()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text(
                      'Selecione a unidade para qual deseja ralizar a resera',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: controller.unidades.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: ListTile(
                            title: Text(controller.unidades[index].apelido.trim()),
                            subtitle: Text('Unidade: ' + controller.unidades[index].codimo),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(controller.unidades[index].logo),
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              size: 40,
                            ),
                            onTap: () => Modular.navigator.pushNamed(RouteName.reservaEspacos, arguments: [controller.unidades[index].codcon, controller.unidades[index].codord]),
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

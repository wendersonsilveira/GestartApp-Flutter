import 'package:Gestart/app/modules/sindico/relatorios/boletos/boletos-unidade/boletos_unidade_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/boletos/lista_boletos_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListaBoletosPage extends StatefulWidget {
  final String title;
  const ListaBoletosPage({Key key, this.title = "Faturas"}) : super(key: key);

  @override
  _ListaBoletosPageState createState() => _ListaBoletosPageState();
}

class _ListaBoletosPageState
    extends ModularState<ListaBoletosPage, ListaBoletosController> {
  bool enableButton = false;
  DateTime startDate;
  DateTime endDate;
  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          switch (controller.unidades.status) {
            case Status.failed:
              return PageError(
                  messageError: controller.boletos.error.message,
                  onPressed: controller.init);
              break;
            case Status.loading:
              return CircularProgressCustom();
              break;
            default:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        child: Text('Selecione uma unidade', style: TextStyle(fontSize: 16))
                      ),
                  ),
                  TextField(
                    onChanged: controller.searchUnidades,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search), hintText: 'Unidade'),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.filteredUnidades.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              child: ListTile(
                            onTap: () {
                              controller.getBoletosUnidade(
                                  controller.filteredUnidades[index].codord);
                            },
                            title: Row(
                              children: [
                                Flexible(
                                    child: Container(
                                        child: Text(
                                            '${controller.filteredUnidades[index].codimo} - ${controller.filteredUnidades[index].nompro}',
                                            overflow: TextOverflow.ellipsis))),
                              ],
                            ),
                            subtitle: controller
                                        .filteredUnidades[index].propri !=
                                    null
                                ? Text(
                                    'Inquilino(a): ${controller.filteredUnidades[index].propri}')
                                : Text(''),
                          ));
                        }),
                  )
                ],
              );
          }
        }));
  }
}

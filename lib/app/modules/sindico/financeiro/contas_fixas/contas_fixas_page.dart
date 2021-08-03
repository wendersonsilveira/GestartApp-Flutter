import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'contas_fixas_controller.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/contas/contas_entity.dart';

class ContasFixasPage extends StatefulWidget {
  final String title;
  const ContasFixasPage({Key key, this.title = "Contas Fixas"})
      : super(key: key);

  @override
  _ContasFixasPageState createState() => _ContasFixasPageState();
}

class _ContasFixasPageState
    extends ModularState<ContasFixasPage, ContasFixasController> {
  List<ContasEntity> contas = [];

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  List<ContasEntity> getContas(int index) {
    var a = controller.contas.data
        .where((element) => element.nomCla == controller.tipos[index].nomCla)
        .toList();
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          switch (controller.contas.status) {
            case Status.loading:
              return CircularProgressCustom();
              break;
            case Status.success:
              return ListView.builder(
                  itemCount: controller.tipos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    height: 16,
                                    color: Colors.grey[350],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '${controller.tipos[index].nomCla}'),
                                        Text('| R\$ 12.0480 '),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          Column(
                              children: getContas(index)
                                  .map((e) => Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              title: e.nomFor != null
                                                  ? Text(e.nomFor)
                                                  : Text(e.nomPla),
                                              subtitle: e.nomFor != null
                                                  ? e.nomPla != null
                                                      ? Text(e.nomPla)
                                                      : Text('')
                                                  : Text(''),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList())
                        ],
                      ),
                    );
                  });
            default:
              return Text('eroooo');
          }
        },
      ),
    );
  }
}

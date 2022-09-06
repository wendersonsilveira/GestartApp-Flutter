import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'informativos_controller.dart';

class InformativosPage extends StatefulWidget {
  final String title;
  const InformativosPage({Key key, this.title = "Comunicados"})
      : super(key: key);

  @override
  _InformativosPageState createState() => _InformativosPageState();
}

class _InformativosPageState
    extends ModularState<InformativosPage, InformativosController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Modular.navigator.pop();
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          switch (controller.condominios.status) {
            case Status.loading:
              return Container(
                child: CircularProgressCustom(),
              );
            case Status.failed:
              return Container(
                child: EmptyWidget(descricao: 'Sem informativos!'),
              );
            default:
              return Column(
                children: <Widget>[
                  Container(
                    child: controller.unidades.data.length > 1
                        ? DropdownButtonFieldWidget(
                            label: 'Condomínio',
                            hint: 'Selecione',
                            value: controller.codCon,
                            list: controller.unidades.data,
                            onChanged: (value) {
                              controller.getComunicados(value);
                            },
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.infor.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: () {
                                  Modular.navigator.pushNamed(
                                      RouteName.informativo,
                                      arguments:
                                          controller.infor.data[index].id);
                                },
                                trailing: Icon(
                                  Icons.arrow_right,
                                  size: 30,
                                ),
                                title:
                                    Text(controller.infor.data[index].apelido),
                                subtitle: Text(
                                  UIHelper.formatDate(
                                      controller.infor.data[index].datEmi),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5, left: 15),
                                child: Text(controller.infor.data[index].att),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field3.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'boleto_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'component/texto_infor_widget.dart';

class BoletoPage extends StatefulWidget {
  final String title;
  const BoletoPage({Key key, this.title = "Boleto"}) : super(key: key);

  @override
  _BoletoPageState createState() => _BoletoPageState();
}

class _BoletoPageState extends ModularState<BoletoPage, BoletoController> {
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
        title: Text('Boleto Digital'),
      ),
      body: Observer(
        builder: (_) => controller.unidades.status == Status.loading ||
                controller.listaView == null
            ? CircularProgressCustom()
            : Column(
                children: <Widget>[
                  Container(
                    height: 110.h,
                    child: DropdownButtonField3Widget(
                      label: 'Unidade',
                      hint: 'Selecione',
                      value: controller.codOrd,
                      list: controller.unidades.data,
                      onChanged: (value) {
                        controller.changeDropdown(value);
                      },
                    ),
                  ),
                  Observer(
                      builder: (_) => controller.listaView.length == 0
                          ? Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.subtitles_off,
                                    size: 70,
                                    color: AppColorScheme.primaryColor,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Text('Não existe boletos para esta unidade'),
                                ],
                              ),
                            )
                          : Expanded(
                              child: Container(
                                child: ListView.builder(
                                  itemCount: controller.listaView.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      margin: EdgeInsets.all(10),
                                      child: Expanded(
                                        child: Container(
                                          child: ListTile(
                                            onTap: () {
                                              Modular.navigator.pushNamed(
                                                  RouteName.detalhe_boleto,
                                                  arguments: controller
                                                      .boletos.data[index].id);
                                            },
                                            trailing: Icon(Icons.arrow_right),
                                            title: Column(
                                              children: [
                                                TextoInforWidget(
                                                  titulo: 'Vencimento',
                                                  valor: UIHelper
                                                      .formatDateFromDateTime(
                                                          controller
                                                              .listaView[index]
                                                              .datven),
                                                ),
                                                TextoInforWidget(
                                                    titulo: 'Valor',
                                                    valor: UIHelper.moneyFormat(
                                                        controller
                                                            .listaView[index]
                                                            .valtot)),
                                                TextoInforWidget(
                                                  titulo: 'Unidade',
                                                  valor: controller
                                                      .listaView[index].codimo,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ))
                ],
              ),
      ),
    );
  }
}

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field3.widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
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
      body: Observer(builder: (_) {
        switch (controller.unidades.status) {
          case Status.loading:
            return Container(child: CircularProgressCustom());
            break;
          case Status.success:
            !controller.unidadeSelecionada
                ? controller.getBoletos(controller.unidades.data[0].codord)
                : () {};
            return 
            Column(
              children: 
              <Widget>[
                Container(
                  height: 110.h,
                  child: DropdownButtonField3Widget(
                    label: 'Unidade',
                    hint: 'Selecione',
                    value: controller.codOrd,
                    list: controller.unidades.data,
                    onChanged: (value) {
                      controller.unidadeSelecionada = true;
                      controller.codOrd = null;
                      controller.getBoletos(value);
                    },
                  ),
                ),
                controller.boletos.status == Status.loading ? CircularProgressCustom()
                : controller.boletos.data != null &&
                        controller.boletos.data.length > 0
                    ? Expanded(
                        child: Container(
                          height: 50.h,
                          child: ListView.builder(
                            itemCount: controller.boletos.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                margin: EdgeInsets.all(10),
                                child: Container(
                                  child: ListTile(
                                    onTap: () {
                                      controller.getBoletoDetalhes(
                                          (controller.boletos.data[index].conts)
                                              .toString());
                                    },
                                    trailing: Icon(Icons.arrow_right),
                                    title: Column(
                                      children: [
                                        TextoInforWidget(
                                          titulo: 'Vencimento',
                                          valor:
                                              UIHelper.formatDateFromDateTime(
                                                  controller.boletos.data[index]
                                                      .datven),
                                        ),
                                        TextoInforWidget(
                                            titulo: 'Valor',
                                            valor: (controller
                                                    .boletos.data[index].total)
                                                .toString()),
                                        TextoInforWidget(
                                          titulo: 'Unidade',
                                          valor: controller
                                              .boletos.data[index].codimo,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.subtitles_off,
                            size: 70,
                            color: AppColorScheme.primaryColor,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text('Não existem boletos para esta unidade'),
                        ],
                      ),
                    )
              ],
            );
          default:
            return PageError(messageError: 'Erro o carregar a tela');
        }
      }),
    );
  }
}

import 'package:Gestart/app/modules/boleto/component/button_expanded_widget.dart';
import 'package:Gestart/app/modules/boleto/component/texto_infor_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_images.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhe_boleto_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetalheBoletoPage extends StatefulWidget {
  final String title;
  final int codord;
  const DetalheBoletoPage({Key key, this.title = "Boleto Digital", this.codord})
      : super(key: key);

  @override
  _DetalheBoletoPageState createState() => _DetalheBoletoPageState();
}

class _DetalheBoletoPageState
    extends ModularState<DetalheBoletoPage, DetalheBoletoController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => controller.boleto.data == null
              ? CircularProgressCustom()
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                        controller.boleto.data.logo,
                        height: 150.h,
                        width: 150.h,
                      ),
                      title: Text(controller.boleto.data.nomCon,
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontFamily: 'roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: AppColorScheme.neutralDefault2,
                          )),
                    ),
                  ),
                  Divider(),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextoInforWidget(
                            titulo: 'Vencimento',
                            valor: UIHelper.formatDateFromDateTime(
                                controller.boleto.data.datVen),
                          ),
                          TextoInforWidget(
                              titulo: 'Valor',
                              valor: UIHelper.moneyFormat(
                                  controller.boleto.data.valTot))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FlutterIcons.barcode_ant,
                            size: 80,
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            controller.boleto.data.linhaDigitavel,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                    ),
                  ),
                  ButtonExpandedWidget(
                    descricao: 'BAIXAR PDF',
                  ),
                  ButtonExpandedWidget(
                    descricao: 'COPIAR CODIGO',
                  ),
                  ButtonExpandedWidget(
                    descricao: 'COMPARTILHAR',
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _isOpen = !_isOpen),
                    child: ExpansionPanelList(
                      children: [
                        ExpansionPanel(
                            headerBuilder: (context, isOpen) {
                              return Container(
                                  padding: EdgeInsets.only(top: 15, left: 15),
                                  child: Text(
                                    'Detalhamento',
                                    style: TextStyle(
                                        fontSize: 32.sp,
                                        fontFamily: 'roboto',
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal),
                                  ));
                            },
                            body: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: controller.inforBoletos.map((e) {
                                    print(e);
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '- ${e['descricao']} - ${UIHelper.moneyFormat(e['valor'])}'),
                                        Divider()
                                      ],
                                    );
                                  }).toList(),
                                )),
                            isExpanded: _isOpen)
                      ],
                      expansionCallback: (i, isOPen) =>
                          setState(() => _isOpen = !isOPen),
                    ),
                  )
                ]),
        ),
      ),
    );
  }
}

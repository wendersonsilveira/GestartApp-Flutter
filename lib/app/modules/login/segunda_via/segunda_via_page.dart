import 'package:Gestart/app/modules/boleto/component/texto_infor_widget.dart';
import 'package:Gestart/app/modules/login/components/cpf_outlined_text_field_widget.dart';
import 'package:Gestart/app/modules/login/segunda_via/segunda_via_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/download/download_generic_widget.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/icons/icons_utils.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/services.dart';

import 'segunda_via_controller.dart';

class SegundaViaPage extends StatefulWidget {
  final String cpfCnpj;
  final String title;

  const SegundaViaPage({Key key, this.cpfCnpj, this.title}) : super(key: key);

  @override
  _SegundaViaPageState createState() => _SegundaViaPageState();
}

class _SegundaViaPageState
    extends ModularState<SegundaViaPage, SegundaViaController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.cpfCnpj);
  }

  final _formKey = GlobalKey<FormState>();
  final _cpfCnpjController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _cpfCnpjController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        center: false,
        title: Text('GestartApp'),
        actions: [
          IconButton(
            icon: Icon(
              FlutterIcons.back_ant,
              color: AppColorScheme.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            icon: Image.asset(
              IconsUtils.logo,
            ),
            onPressed: () => {},
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: _cpfCnpjController..text = widget.cpfCnpj,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'É necessário preencher com CPJ ou CNPJ';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ContainedButtonWidget(
                text: "Pesquisar",
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    controller.getBoletos(_cpfCnpjController.text);
                  }
                }),
            Expanded(
              child: Observer(builder: (_) {
                if (controller.boletos?.status == Status.loading)
                  return CircularProgressCustom();
                if (controller.hasFaturas && controller.checked) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView.builder(
                      itemCount: controller.boletos.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: Container(
                            child: ListTile(
                              onTap: () {},
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DownloadGenericWidget(
                                    fileName:
                                        'Fatura_${controller.boletos.data[index].identificador}',
                                    fileURL: controller
                                        .boletos.data[index].linkBoleto,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Baixar PDF',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                              title: Column(
                                children: [
                                  TextoInforWidget(
                                    titulo: 'Vencimento',
                                    valor: UIHelper.formatDateFromDateTime(
                                        controller.boletos.data[index].datven),
                                  ),
                                  TextoInforWidget(
                                      titulo: 'Valor',
                                      valor: (controller
                                              .boletos.data[index].valtot)
                                          .toString()),
                                  TextoInforWidget(
                                    titulo: 'Unidade',
                                    valor:
                                        controller.boletos.data[index].codimo,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: GestureDetector(
                                          onTap: () async {
                                            ClipboardData data = ClipboardData(
                                                text: controller
                                                    .boletos
                                                    .data[index]
                                                    .linhaDigitavel);

                                            await Clipboard.setData(data);

                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    content: Text(
                                                        'Copiado para área de transferência')));

                                            ClipboardData data2 =
                                                await Clipboard.getData(
                                                    Clipboard.kTextPlain);
                                            print(data2.text);
                                          },
                                          child: Text(
                                            'Linha digitável: ${controller.boletos.data[index].linhaDigitavel}',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                  
                }
                if (!controller.hasFaturas && controller.checked)
                    return EmptyWidget(
                      descricao: 'Não há faturas para esse CPJ ou CNPJ',
                    );
                if (!controller.hasFaturas && !controller.checked)
                    return EmptyWidget(
                      descricao: 'Pesquise por um CPF ou CNPJ',
                    );
                // return Container();
              }
                  // return EmptyWidget(descricao: 'Não foram identificados boletos para esse CPF/CNPJ',);
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

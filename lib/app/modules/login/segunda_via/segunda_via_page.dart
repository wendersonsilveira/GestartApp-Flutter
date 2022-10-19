import 'package:Gestart/app/modules/boleto/component/texto_infor_widget.dart';
import 'package:Gestart/app/modules/login/segunda_via/segunda_via_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field3.widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cpfcnpj/cpfcnpj.dart';

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
    _cpfCnpjController.dispose();
    super.dispose();
  }

  Future<void> _onactionCheckUser() async {
    if (!_formKey.currentState.validate()) return;
    if (_formKey.currentState.validate()) {
      final check = await controller
          .checkUser(IdUserEntity(cpfCnpj: _cpfCnpjController.text));

      if (check.status == Status.failed) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          CustomAlertDialog.error(context, check.error.message);
        });
      } else {
        // return controller.getUnidades(controller.cpfCnpj);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text('Boleto Digital'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _cpfCnpjController..text = widget.cpfCnpj,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Ink(
                      decoration: const ShapeDecoration(
                        color: AppColorScheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: IconButton(
                        disabledColor: Colors.grey.shade300,
                        icon: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          
                          await _onactionCheckUser();
                          if(_formKey.currentState.validate()) {
                            await controller.getUnidades(_cpfCnpjController.text);
                          }
                        },
                      ),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'É necessário preencher com CPF ou CNPJ';
                  }
                  if (value.characters.length < 12) {
                    if (CPF.isValid((CPF.format(value)))) {
                      return null;
                    }
                  }
                  if (CNPJ.isValid(CNPJ.format(value))) {
                    return null;
                  } else {
                    return 'CPF ou CNPJ inválido';
                  }
                },
              ),
            ),
          ),

          // body ---------------------------------------------------------------------------------------------------------------

          Expanded(
            child: Observer(builder: (_) {
              if (controller.unidades != null)
                switch (controller.unidades.status) {
                  case Status.loading:
                    return Container(child: CircularProgressCustom());
                    break;
                  case Status.success:
                    !controller.unidadeSelecionada
                        ? controller
                            .getBoletos(controller.unidades.data[0].codord)
                        : () {};
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 110,
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
                        controller.boletos.status == Status.loading
                            ? CircularProgressCustom()
                            : controller.boletos.status == Status.success &&
                                    controller.boletos.data.length > 0
                                ? Expanded(
                                    child: Container(
                                      height: 50,
                                      child: ListView.builder(
                                        itemCount:
                                            controller.boletos.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
                                            margin: EdgeInsets.all(10),
                                            child: Container(
                                              child: ListTile(
                                                onTap: () {
                                                  controller.getBoletoDetalhes(
                                                      (controller
                                                              .boletos
                                                              .data[index]
                                                              .conts)
                                                          .toString());
                                                },
                                                trailing:
                                                    Icon(Icons.arrow_right),
                                                title: Column(
                                                  children: [
                                                    TextoInforWidget(
                                                      titulo: 'Vencimento',
                                                      valor: UIHelper
                                                          .formatDateFromDateTime(
                                                              controller
                                                                  .boletos
                                                                  .data[index]
                                                                  .datven),
                                                    ),
                                                    TextoInforWidget(
                                                        titulo: 'Valor',
                                                        valor: (controller
                                                                .boletos
                                                                .data[index]
                                                                .total)
                                                            .toString()),
                                                    TextoInforWidget(
                                                      titulo: 'Unidade',
                                                      valor: controller.boletos
                                                          .data[index].codimo,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.subtitles_off,
                                          size: 70,
                                          color: AppColorScheme.primaryColor,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                            'Não existem boletos para esta unidade'),
                                      ],
                                    ),
                                  )
                      ],
                    );
                  default:
                    return PageError(messageError: 'Erro o carregar a tela');
                }
              return EmptyWidget(
                descricao: 'Pesquise por um CPF ou CNPJ cadastrado.',
              );
            }),
          )
        ]),
      ),
    );
  }
}

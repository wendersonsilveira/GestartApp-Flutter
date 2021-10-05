import 'dart:async';

import 'package:Gestart/app/modules/condominio/ativar_condominio/enviar_codigo/enviar_codigo_page.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/inputs/outlined_text_field_form_widget.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'codigo_ativacao_controller.dart';

class CodigoAtivacaoPage extends StatefulWidget {
  final String title;
  const CodigoAtivacaoPage({Key key, this.title = "Código de Ativação"})
      : super(key: key);

  @override
  _CodigoAtivacaoPageState createState() => _CodigoAtivacaoPageState();
}

class _CodigoAtivacaoPageState
    extends ModularState<CodigoAtivacaoPage, CodigoAtivacaoController> {
  PageController controllerPages = PageController(initialPage: 0);
  final _codigoAtivacaoController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  mudarPage(int indice) {
    setState(() {
      controllerPages.animateToPage(indice,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  ativarCodigo(String codigo) async {
    int result = await controller.ativar(codigo);
    if (result == -1)
      CustomAlertDialog.error(context, 'Tente gerar o código novamente');
    else if (result == 2)
      CustomAlertDialog.error(
          context, 'Gere um Novo Código, esse só é valido por 2 horas.');
    else if (result == 1) {
      UIHelper.showInSnackBar('Ativado com sucesso', _scaffoldKey);
      Timer(Duration(seconds: 1), () {
        Modular.navigator.pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: PageView(
        controller: controllerPages,
        physics: new NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DIGITE O CÓDIGO',
                          ),
                          Text(
                              'Insira o código que foi enviado para o seu Email'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    OutlinedTextFieldFormWidget(
                      keyboardType: TextInputType.name,
                      validator: Validators.empty,
                      controller: _codigoAtivacaoController,
                      hint: 'Código de Ativação',
                      isWhite: true,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Observer(builder: (_) {
                            return ContainedButtonWidget(
                              text: "ATIVAR",
                              onPressed: () =>
                                  ativarCodigo(_codigoAtivacaoController.text),
                              loading:
                                  (controller.ativacao.status == Status.loading)
                                      ? true
                                      : false,
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                        onTap: () => mudarPage(1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'GERAR UM NOVO CÓDIGO',
                            style:
                                TextStyle(color: AppColorScheme.primaryColor),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
          EnviarCodigoPage()
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/condominio/emails_ativacao_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'enviar_codigo_controller.dart';

class EnviarCodigoPage extends StatefulWidget {
  final String title;
  const EnviarCodigoPage({Key key, this.title = "EnviarCodigo"})
      : super(key: key);

  @override
  _EnviarCodigoPageState createState() => _EnviarCodigoPageState();
}

class _EnviarCodigoPageState
    extends ModularState<EnviarCodigoPage, EnviarCodigoController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.getEmails();
  }

  int idEmail = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  gerarCodigo() async {
    if (idEmail != 0) {
      var statusCodigo = await controller.gerarCodigo(idEmail);

      if (statusCodigo == 1) {
        UIHelper.showInSnackBar(
            'O código foi enviado para o seu E-mail', _scaffoldKey);
        Timer(Duration(seconds: 2), () {
          Modular.to.pop();
        });
      }
    } else
      UIHelper.showInSnackBar('Selecione um E-mail!', _scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: 300,
        child: Card(
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Enviar novo código'),
                subtitle: Text(
                  'O código será enviado para o E-mail selecionado',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Observer(builder: (_) {
                switch (controller.emails.status) {
                  case Status.loading:
                    return CircularProgressCustom();
                  case Status.success:
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: controller.emails.data.length > 0
                              ? DropdownButtonFormField<EmailAtivacaoEntity>(
                                  hint: Text('Email'),
                                  items: controller.emails.data.map(
                                      (EmailAtivacaoEntity dropDownStringItem) {
                                    return DropdownMenuItem<
                                        EmailAtivacaoEntity>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem.email),
                                    );
                                  }).toList(),
                                  onChanged: (value) => idEmail = value.id,
                                )
                              : Text(
                                  'Você não possui nenhum e-mail cadastrado, ligue para 3133-0001'),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: controller.emails.data.length > 0
                                    ? ContainedButtonWidget(
                                        text: "Gerar Código",
                                        onPressed: () => gerarCodigo(),
                                        loading: controller.statusGeracaoCodigo
                                                    .status ==
                                                Status.loading
                                            ? true
                                            : false,
                                      )
                                    : ContainedButtonWidget(
                                        onPressed: () {},
                                        text: "Gerar Código",
                                      ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                    break;
                  default:
                    return Center(
                      child: PageError(
                        messageError: 'Erro ao carregar as informações',
                        onPressed: (_) => controller.getEmails(),
                      ),
                    );
                }
              }),
              GestureDetector(
                  onTap: () => Modular.to.pop(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Digitar código existente',
                      style: TextStyle(color: AppColorScheme.primaryColor),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

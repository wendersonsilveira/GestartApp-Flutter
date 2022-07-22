import 'dart:async';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/login/components/cpf_outlined_text_field_widget.dart';
import 'package:Gestart/app/modules/login/components/password_outlined_text_field_widget.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'condominio_online_controller.dart';

class CondominioOnlinePage extends StatefulWidget {
  final String title;
  const CondominioOnlinePage({Key key, this.title = "Condominio Online"})
      : super(key: key);

  @override
  _CondominioOnlinePageState createState() => _CondominioOnlinePageState();
}

class _CondominioOnlinePageState
    extends ModularState<CondominioOnlinePage, CondominioOnlineController> {
  //use 'controller' variable to access controller

  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  Future<void> _onactionLogin() async {
    if (!_formKey.currentState.validate()) return;
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      final login = await controller.ativarCondominio(LoginAuthEntity(
          usuario: _usuarioController.text, senha: _senhaController.text));

      if (login.status == Status.failed) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          CustomAlertDialog.error(context, login.message);
        });
      } else if (login.data == 1) {
        showInSnackBar('Condomínio ativado com sucesso');
        Timer(Duration(seconds: 1), () {
          Modular.to.popAndPushNamed(RouteName.home);
        });
      } else {
        showInSnackBar('Credenciais incorretas');
      }
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
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6,
              // padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Quase lá',
                        style: AppTextTheme.negritoInformativo,
                      ),
                      Text.rich(
                        TextSpan(text: 'informe o ', children: [
                          TextSpan(
                              text: 'USUÁRIO ',
                              style: AppTextTheme.negritoInformativo),
                          TextSpan(text: 'e '),
                          TextSpan(
                              text: 'SENHA ',
                              style: AppTextTheme.negritoInformativo),
                          TextSpan(
                              text:
                                  'do condominío online que é enviado no seu boleto.'),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('INFORME SUAS CREDENCIAIS'),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Observer(
                            builder: (_) => OutlinedTextFieldWidget(
                              placeholder: "Usuário",
                              validator: Validators.empty,
                              isText: true,
                              isWhite: true,
                              controller: _usuarioController,
                            ),
                          ),
                          PasswordOutlinedTextFieldWidget(
                            controller: _senhaController,
                            isWhite: true,
                            placeholder: "Senha",
                            validator: Validators.password,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Observer(builder: (_) {
                                  return ContainedButtonWidget(
                                    text: "ATIVAR",
                                    onPressed: _onactionLogin,
                                    // loading: (controller.loadingCheck.status ==
                                    //             Status.loading ||
                                    //         controller.userLogin.status ==
                                    //             Status.loading)
                                    //     ? true
                                    //     : false,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}

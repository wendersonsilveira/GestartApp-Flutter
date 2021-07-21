import 'dart:async';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/login/components/password_text_field_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/types/error_dialog.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/user/password_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'component/button_expanded_widget.dart';
import 'component/button_widget.dart';
import 'perfil_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _senhaAtual = TextEditingController();
  final _senhaNova = TextEditingController();
  final _senhaConfirmacao = TextEditingController();

  final FocusNode senhaAtualFocus = FocusNode();
  final FocusNode senhaNovaFocus = FocusNode();
  final FocusNode senhaConfirmacaoFocus = FocusNode();

  _showDialogConfirmarSenha(acao) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Informe sua senha'),
              content: Form(
                key: _formKey,
                child: Observer(
                  builder: (_) => PasswordTextFieldWidget(
                    placeholder: 'Senha',
                    controller: _senhaAtual,
                    validator: Validators.password,
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      zerarFormulario();
                      Modular.navigator.pop();
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: AppColorScheme.primaryColor),
                    )),
                Observer(
                  builder: (_) => TextButton(
                      onPressed: acao == 0 ? confirmarExclusao : alterarPefril,
                      child: controller.statusAlterarSenha.status ==
                              Status.loading
                          ? CircularProgressCustom()
                          : Text(
                              'Ok',
                              style:
                                  TextStyle(color: AppColorScheme.primaryColor),
                            )),
                )
              ],
            ));
  }

  alterarPefril() {
    controller.checarSenha(_senhaAtual.text).then((value) {
      if (value) {
        Modular.navigator
            .popAndPushNamed(RouteName.alterar_perfil,
                arguments: controller.perfil.data)
            .then((value) => controller.init());
      } else {
        Modular.navigator.pop();
        showInSnackBar('Senha Incorreta');
      }
    });
  }

  _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Alterar Senha'),
              content: Form(
                key: _formKey,
                child: Observer(
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PasswordTextFieldWidget(
                        placeholder: 'Senha Atual',
                        controller: _senhaAtual,
                        validator: Validators.password,
                      ),
                      PasswordTextFieldWidget(
                        placeholder: 'Nova Senha',
                        controller: _senhaNova,
                        validator: Validators.password,
                      ),
                      PasswordTextFieldWidget(
                        placeholder: 'Confirme Sua Senha',
                        controller: _senhaConfirmacao,
                        validator: (_) {
                          if (_senhaNova.text != _senhaConfirmacao.text) {
                            return "Senhas diferentes";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      zerarFormulario();
                      Modular.navigator.pop();
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: AppColorScheme.primaryColor),
                    )),
                Observer(
                  builder: (_) => TextButton(
                      onPressed: confirmarAlteracao,
                      child: controller.statusAlterarSenha.status ==
                              Status.loading
                          ? CircularProgressCustom()
                          : Text(
                              'Ok',
                              style:
                                  TextStyle(color: AppColorScheme.primaryColor),
                            )),
                )
              ],
            ));
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  zerarFormulario() {
    _senhaAtual.text = '';
    _senhaNova.text = '';
    _senhaConfirmacao.text = '';
  }

  confirmarAlteracao() {
    if (!_formKey.currentState.validate()) return;
    if (_formKey.currentState.validate()) {
      controller
          .alterarSenha(PasswordEntity(
              senha: _senhaAtual.text,
              senhaNova: _senhaNova.text,
              senhaConfirmacao: _senhaConfirmacao.text))
          .then((value) {
        if (value['id'] == true) {
          zerarFormulario();
          Modular.navigator.pop();
          showInSnackBar(value['message']);
        } else if (value['message'] == 'MESMA_SENHA')
          showDialog(
            context: context,
            builder: (_) => ErrorDialog(
              error: 'Nova senha é igual a atual',
            ),
            barrierDismissible: false,
          );
        else if (value['message'] == 'SENHA_INVALIDA')
          showDialog(
            context: context,
            builder: (_) => ErrorDialog(
              error: 'Senha Incorreta',
            ),
            barrierDismissible: false,
          );
      });
    }
  }

  confirmarExclusao() {
    controller.checarSenha(_senhaAtual.text).then((value) {
      if (value) {
        Modular.navigator.pop();
        showInSnackBar('Usuario excluido com sucesso');
        Timer(Duration(seconds: 1), () {
          controller.excluirConta();
        });
      } else {
        Modular.navigator.pop();
        showInSnackBar('Senha Incorreta');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        leading: Container(),
        actions: [
          TextButton(
            onPressed: () => _showDialogConfirmarSenha(1),
            child: Text('ALTERAR', style: AppTextTheme.textActionButton),
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Observer(builder: (_) {
          switch (controller.perfil.status) {
            case Status.success:
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Seus Dados',
                        style: AppTextTheme.negritoInformativo,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColorScheme.backgroundGreyLight,
                        backgroundImage:
                            NetworkImage(controller.perfil.data.linkPhoto),
                      ),
                      title: Text('Nome'),
                      subtitle: Text('${controller.perfil.data.nome} ' +
                          '${controller.perfil.data.sobreNome}'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Email'),
                      subtitle: Text(controller.perfil.data.email),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('CPF/CNPJ'),
                      subtitle: Text(controller.perfil.data.cpfCnpj),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Telefone'),
                      subtitle: Text(controller.perfil.data.telefone),
                    ),
                    Divider(),
                    ButtonExpandedWidget(
                      descricao: 'SAIR',
                      funcao: () => controller.logout(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonWidget(
                          descricao: 'ALTERAR SENHA',
                          funcao: () => _showDialog(),
                          cor: AppColorScheme.backgroundColor,
                        ),
                        ButtonWidget(
                          descricao: 'EXCLUIR CONTA',
                          funcao: () => _showDialogConfirmarSenha(0),
                          cor: Colors.red,
                          corTexto: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              );
              break;
            case Status.failed:
              return Container(
                padding: const EdgeInsets.only(
                    top: 16, left: 32, right: 32, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/error.png',
                      height: 60,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Não foi possível carregar suas informações',
                      textAlign: TextAlign.center,
                      style: AppTextTheme.messageError,
                    ),
                  ],
                ),
              );
              break;
            default:
              return Center(child: CircularProgressCustom());
          }
        }),
      ),
    );
  }
}

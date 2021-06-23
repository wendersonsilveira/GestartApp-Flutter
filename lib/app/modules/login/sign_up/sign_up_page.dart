import 'dart:async';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/domain/entities/user/create_user_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  final String cpfCnpj;
  final String title;
  const SignUpPage({Key key, @required this.cpfCnpj, this.title})
      : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  @override
  void initState() {
    _cpfCnpjController.text = widget.cpfCnpj;
    super.initState();
  }

  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  Future<void> _onactionCreateUser() async {
    if (!_formKey.currentState.validate()) return;
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      final createUser = await controller.createUser(CreateUserEntity(
          nome: _nomeController.text,
          sobreNome: _sobreNomeController.text,
          email: _emailController.text,
          confirmaEmail: _confirmarEmailController.text,
          cpfCnpj: _cpfCnpjController.text,
          senha: _senhaController.text,
          confirmaSenha: _senhaController.text,
          telefone: _telefoneController.text));

      if (createUser.status == Status.failed) {
        showInSnackBar(createUser.message);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          CustomAlertDialog.error(context, createUser.error.message);
        });
      }

      if (createUser.status == Status.success) {
        showInSnackBar('Usuario criado com sucesso');
        Timer(Duration(seconds: 1), () {
          Modular.navigator.pop();
        });
      }
    }
  }

  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _sobreNomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmarEmailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _sobreNomeFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _confirmarEmailFocus = FocusNode();
  final FocusNode _telefoneFocus = FocusNode();
  final FocusNode _cpfCnpjFocus = FocusNode();
  final FocusNode _senhaFocus = FocusNode();
  final FocusNode _confirmarSenhaFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        textTitle: 'Criar Conta',
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UnderlineTextFieldWidget(
                        labelText: "Nome",
                        controller: _nomeController,
                        validator: Validators.empty,
                        leftIcon: FlutterIcons.account_outline_mco,
                        keyboardType: TextInputType.name,
                        focusNode: _nomeFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_nomeFocus);
                        }),
                    UnderlineTextFieldWidget(
                        labelText: "Sobrenome",
                        controller: _sobreNomeController,
                        validator: Validators.empty,
                        leftIcon: FlutterIcons.account_outline_mco,
                        keyboardType: TextInputType.name,
                        focusNode: _sobreNomeFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_sobreNomeFocus);
                        }),
                    UnderlineTextFieldWidget(
                        labelText: "Email",
                        controller: _emailController,
                        validator: Validators.email,
                        leftIcon: FlutterIcons.email_multiple_outline_mco,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _emailFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_emailFocus);
                        }),
                    UnderlineTextFieldWidget(
                        labelText: "Confime o E-mail",
                        controller: _confirmarEmailController,
                        validator: Validators.email,
                        leftIcon: FlutterIcons.email_multiple_outline_mco,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _confirmarEmailFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_emailFocus);
                        }),
                    UnderlineTextFieldWidget(
                        labelText: "Telefone",
                        controller: _telefoneController,
                        validator: Validators.phone,
                        leftIcon: FlutterIcons.phone_android_mdi,
                        keyboardType: TextInputType.number,
                        focusNode: _telefoneFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_telefoneFocus);
                        }),
                    UnderlineTextFieldWidget(
                        labelText: "",
                        controller: _cpfCnpjController,
                        validator: Validators.cpfOrCnpj,
                        leftIcon: FlutterIcons.account_outline_mco,
                        keyboardType: TextInputType.name,
                        focusNode: _cpfCnpjFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_cpfCnpjFocus);
                        }),
                    UnderlineTextFieldWidget(
                        labelText: "Senha",
                        controller: _senhaController,
                        validator: Validators.password,
                        keyboardType: TextInputType.name,
                        leftIcon: FlutterIcons.lock_ant,
                        focusNode: _senhaFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_senhaFocus);
                        }),
                    UnderlineTextFieldWidget(
                        labelText: "Confirme a Senha",
                        controller: _confirmarSenhaController,
                        validator: Validators.password,
                        leftIcon: FlutterIcons.lock_ant,
                        keyboardType: TextInputType.name,
                        focusNode: _confirmarSenhaFocus,
                        onSubmitted: (value) {
                          Focus.of(context).requestFocus(_confirmarSenhaFocus);
                        }),
                    SizedBox(
                      height: 26.h,
                    ),
                    ContainedButtonWidget(
                      text: "Criar Conta",
                      onPressed: _onactionCreateUser,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

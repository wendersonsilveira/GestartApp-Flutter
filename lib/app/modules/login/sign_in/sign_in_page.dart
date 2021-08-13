import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/login/components/cpf_outlined_text_field_widget.dart';
import 'package:Gestart/app/modules/login/components/password_outlined_text_field_widget.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';
import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:Gestart/app/styles/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ModularState<SignInPage, SignInController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.testsUseCases();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final _cpfCnpjController = TextEditingController();
  final _senhaController = TextEditingController();

  Future<void> _onactionLogin() async {
    if (!_formKey.currentState.validate()) return;
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      final login = await controller.login(LoginAuthEntity(
          usuario: _cpfCnpjController.text, senha: _senhaController.text));

      if (login.status == Status.failed) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          CustomAlertDialog.error(context, login.message);
        });
      } else if (login.data.status == 1) {
        Modular.navigator.popAndPushNamed(RouteName.home);
      }
    }
  }

  Future<void> _onactionCheckUser() async {
    if (!_formKey.currentState.validate()) return;
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      final check = await controller
          .checkUser(IdUserEntity(cpfCnpj: _cpfCnpjController.text));

      if (check.status == Status.failed) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          CustomAlertDialog.error(context, check.error.message);
        });
      } else {
        if (check.data == 1)
          controller.mudarStatusUsuario(true);
        else if (check.data == -1) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(
                  'Bem Vindo, você é novo no GestartApp, por isso precisamos de algumas informações'),
              backgroundColor: Colors.black,
              titleTextStyle: TextStyle(color: Colors.grey),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Modular.navigator.pushNamed(RouteName.signup,
                          arguments: _cpfCnpjController.text);
                    },
                    child: Text('Ok'))
              ],
            ),
            barrierDismissible: false,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage(AppImages.bgLogin),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 60.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.icon,
                      width: 300.w,
                      height: 300.h,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Gestart App",
                      textAlign: TextAlign.center,
                      style: AppTextTheme.gestartLogin,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Container(
                      width: 600.w,
                      height: 400.h,
                      child: Column(
                        children: [
                          OutlinedTextFieldWidget(
                            placeholder: "CPF/CNPJ",
                            validator: Validators.cpfOrCnpj,
                            controller: _cpfCnpjController,
                            onChange: (value) async {
                              if (_formKey.currentState.validate()) {
                                _onactionCheckUser();
                              }
                              if (!_formKey.currentState.validate())
                                controller.mudarStatusUsuario(false);
                            },
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                          Observer(builder: (_) {
                            return controller.usuarioCadastrado == true
                                ? PasswordOutlinedTextFieldWidget(
                                    controller: _senhaController,
                                    placeholder: "SENHA",
                                    validator: Validators.password,
                                  )
                                : Text("");
                          }),
                          Row(
                            children: [
                              Expanded(
                                child: Observer(builder: (_) {
                                  return ContainedButtonWidget(
                                    text: "CONTINUAR",
                                    onPressed: _onactionLogin,
                                    loading: (controller.loadingCheck.status ==
                                                Status.loading ||
                                            controller.userLogin.status ==
                                                Status.loading)
                                        ? true
                                        : false,
                                  );
                                }),
                              ),
                            ],
                          ),
                          const Spacer(flex: 1),
                          Observer(builder: (_) {
                            return controller.usuarioCadastrado == true
                                ? FlatButtonWidget(
                                    text: "Esqueci minha senha",
                                    onPressed: () => {
                                      Modular.navigator
                                          .pushNamed(RouteName.forgot_password),
                                    },
                                  )
                                : Text("");
                          }),
                        ],
                      ),
                    ),
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

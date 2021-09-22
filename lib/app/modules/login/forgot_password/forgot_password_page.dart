import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'forgot_password_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  const ForgotPasswordPage({Key key, this.title = "ForgotPassword"}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ModularState<ForgotPasswordPage, ForgotPasswordController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final FocusNode _idFocus = FocusNode();

  Future<void> _onupdatePassword() async {
    if (!_formKey.currentState.validate()) return;
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      final updatePassword = await controller.updatePassword(UpdatePasswordEntity(identificador: _idController.text));

      if (updatePassword.status == Status.failed) {
        if (updatePassword.error == null) {
          CustomAlertDialog.error(context, updatePassword.message);
        } else {
          CustomAlertDialog.error(context, updatePassword.error.message);
        }
      } else {
        if (updatePassword.data.status == 1)
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Senha recuperada, Foi enviado um e-mail para ' + updatePassword.data.email),
              backgroundColor: Colors.black,
              titleTextStyle: TextStyle(color: Colors.grey),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Modular.navigator.pop();
                    },
                    child: Text('Ok'))
              ],
            ),
            barrierDismissible: false,
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        textTitle: 'Recuperar Senha',
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Informe seu e-mail, CPF ou CNPJ abaixo e você recebá um e-mail com orientações para recuperar sua senha."),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: UnderlineTextFieldWidget(
                      labelText: "E-mail ou CPF/CNPJ",
                      controller: _idController,
                      validator: Validators.empty,
                      keyboardType: TextInputType.name,
                      focusNode: _idFocus,
                      onSubmitted: (value) {
                        Focus.of(context).requestFocus(_idFocus);
                      }),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Observer(builder: (context) {
                  return ContainedButtonWidget(
                    text: "Enviar",
                    onPressed: _onupdatePassword,
                    loading: controller.loading,
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

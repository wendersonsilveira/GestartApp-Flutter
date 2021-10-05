import 'package:Gestart/app/modules/perfil/component/button_expanded_widget.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'alterar_perfil_controller.dart';

class AlterarPerfilPage extends StatefulWidget {
  final String title;
  final UserEntity usuario;
  const AlterarPerfilPage({Key key, this.title = "Alterar", this.usuario})
      : super(key: key);

  @override
  _AlterarPerfilPageState createState() => _AlterarPerfilPageState();
}

class _AlterarPerfilPageState
    extends ModularState<AlterarPerfilPage, AlterarPerfilController> {
  //use 'controller' variable to access controller

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  enviarAlteracao() {
    if (_formKey.currentState.validate()) {
      controller.alterar().then((value) {
        if (value) Modular.navigator.pop();
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _sobreNomeFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _telefoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => controller.perfil.status == Status.loading
            ? CircularProgressCustom()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.usuario.linkPhoto),
                          ),
                          title: UnderlineTextFieldWidget(
                              labelText: "Nome",
                              controller: controller.nomeController,
                              validator: Validators.empty,
                              keyboardType: TextInputType.name,
                              focusNode: _nomeFocus,
                              initialValue: 'teste',
                              contentPadding: true,
                              onSubmitted: (value) {
                                Focus.of(context).requestFocus(_sobreNomeFocus);
                              }),
                        ),
                        UnderlineTextFieldWidget(
                            initialValue: 'teste',
                            labelText: "Sobrenome",
                            controller: controller.sobreNomeController,
                            validator: Validators.empty,
                            contentPadding: true,
                            keyboardType: TextInputType.name,
                            focusNode: _sobreNomeFocus,
                            onSubmitted: (value) {
                              Focus.of(context).requestFocus(_emailFocus);
                            }),
                        UnderlineTextFieldWidget(
                            labelText: "Email",
                            controller: controller.emailController,
                            initialValue: 'teste',
                            validator: Validators.email,
                            contentPadding: true,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocus,
                            onSubmitted: (value) {
                              Focus.of(context).requestFocus(_telefoneFocus);
                            }),
                        UnderlineTextFieldWidget(
                            labelText: "Telefone",
                            controller: controller.telefoneController,
                            validator: Validators.phone,
                            initialValue: 'teste',
                            contentPadding: true,
                            keyboardType: TextInputType.number,
                            focusNode: _telefoneFocus,
                            onSubmitted: (value) {
                              Focus.of(context).requestFocus(_telefoneFocus);
                            }),
                        UnderlineTextFieldWidget(
                          labelText: "CPF/CNPJ",
                          controller: controller.cpfCnpjController,
                          contentPadding: true,
                          enabled: false,
                        ),
                        Divider(),
                        ButtonExpandedWidget(
                          descricao: 'Salvar',
                          corTexto: true,
                          funcao: () => enviarAlteracao(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

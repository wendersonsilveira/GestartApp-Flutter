import 'package:Gestart/app/modules/perfil/component/button_expanded_widget.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'alterar_perfil_controller.dart';

class AlterarPerfilPage extends StatefulWidget {
  final String title;
  final UserEntity usuario;
  const AlterarPerfilPage({Key key, this.title = "AlterarPerfil", this.usuario})
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
    print(widget.usuario);
    inserirValoresIniciais();
    super.initState();
  }

  inserirValoresIniciais() {
    _nomeController.text = widget.usuario.nome;
    _sobreNomeController.text = widget.usuario.sobreNome;
    _emailController.text = widget.usuario.email;
    _telefoneController.text = widget.usuario.telefone;
    _cpfCnpjController.text = widget.usuario.cpfCnpj;
  }

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _sobreNomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cpfCnpjController = TextEditingController();

  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _sobreNomeFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _telefoneFocus = FocusNode();
  final FocusNode _cpfCnpjFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.usuario.linkPhoto),
                ),
                title: UnderlineTextFieldWidget(
                    labelText: "Nome",
                    controller: _nomeController,
                    validator: Validators.empty,
                    keyboardType: TextInputType.name,
                    focusNode: _nomeFocus,
                    contentPadding: true,
                    onSubmitted: (value) {
                      Focus.of(context).requestFocus(_sobreNomeFocus);
                    }),
              ),
              UnderlineTextFieldWidget(
                  labelText: "Sobrenome",
                  controller: _sobreNomeController,
                  validator: Validators.empty,
                  contentPadding: true,
                  keyboardType: TextInputType.name,
                  focusNode: _sobreNomeFocus,
                  onSubmitted: (value) {
                    Focus.of(context).requestFocus(_emailFocus);
                  }),
              UnderlineTextFieldWidget(
                  labelText: "Email",
                  controller: _emailController,
                  validator: Validators.email,
                  contentPadding: true,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocus,
                  onSubmitted: (value) {
                    Focus.of(context).requestFocus(_telefoneFocus);
                  }),
              UnderlineTextFieldWidget(
                  labelText: "Telefone",
                  controller: _telefoneController,
                  validator: Validators.phone,
                  contentPadding: true,
                  keyboardType: TextInputType.number,
                  focusNode: _telefoneFocus,
                  onSubmitted: (value) {
                    Focus.of(context).requestFocus(_telefoneFocus);
                  }),
              UnderlineTextFieldWidget(
                labelText: "CPF/CNPJ",
                controller: _cpfCnpjController,
                contentPadding: true,
                enabled: false,
              ),
              Divider(),
              ButtonExpandedWidget(
                descricao: 'Salvar',
                corTexto: true,
                funcao: () {
                  print('teste');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

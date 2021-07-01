import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_pet_controller.dart';

class CadastroPetPage extends StatefulWidget {
  final String title;
  const CadastroPetPage({Key key, this.title = "Cadastro de pet"})
      : super(key: key);

  @override
  _CadastroPetPageState createState() => _CadastroPetPageState();
}

class _CadastroPetPageState
    extends ModularState<CadastroPetPage, CadastroPetController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final FocusNode _nomeFocus = FocusNode();
  final tipos = ['Cachorro', 'Gato', 'Pássaro', 'Outro'];

  handleSubmit() {
    // print(_formKey.);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Container(
          child: Column(
        children: [
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  DropdownButton<String>(
                      value: 'Cachorro',
                      items: tipos.map(
                        (value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: null),
                  UnderlineTextFieldWidget(
                      labelText: "Nome",
                      controller: _nomeController,
                      validator: Validators.empty,
                      keyboardType: TextInputType.name,
                      focusNode: _nomeFocus,
                      onSubmitted: (value) {
                        Focus.of(context).requestFocus(_nomeFocus);
                      }),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

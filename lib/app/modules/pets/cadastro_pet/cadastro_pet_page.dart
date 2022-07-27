import 'dart:async';

import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field2.widget.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/pet/pet_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_pet_controller.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';

class CadastroPetPage extends StatefulWidget {
  final String title;
  final int id;
  const CadastroPetPage({Key key, this.title = "Cadastro de pet", this.id})
      : super(key: key);

  @override
  _CadastroPetPageState createState() => _CadastroPetPageState();
}

class _CadastroPetPageState
    extends ModularState<CadastroPetPage, CadastroPetController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> tipos = ['', 'Cachorro', 'Gato', 'Pássaro', 'Outro'];
  final List<String> portes = ['', 'Pequeno', 'Médio', 'Grande'];

  final _nomeController = TextEditingController();
  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _tipoFocus = FocusNode();
  final _racaController = TextEditingController();
  final FocusNode _racaFocus = FocusNode();
  final FocusNode _porteFocus = FocusNode();
  String _tipoController;
  String _porteController;
  String textButton = 'SALVAR';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  Future<void> handleSubmit() async {
    if (_formKey.currentState.validate()) {
      PetEntity pet;
      if (widget.id != null) {
        pet = PetEntity(
            id: widget.id,
            nome: _nomeController.text,
            porte: _porteController,
            raca: _racaController.text,
            tipo: _tipoController);
      } else {
        pet = PetEntity(
            nome: _nomeController.text,
            porte: _porteController,
            raca: _racaController.text,
            tipo: _tipoController);
      }

      final r = await controller.createPet(pet);

      if (r.status == Status.failed) {
        showInSnackBar(r.message);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          CustomAlertDialog.error(context, r.error.message);
          controller.alteraLoading(false);
        });
      }

      if (r.status == Status.success) {
        showInSnackBar('Pet adicionado com sucesso');
        Timer(Duration(seconds: 1), () {
          Modular.to.pop();
          controller.alteraLoading(false);
        });
      }
    }
  }

  @override
  void initState() {
    if (widget.id != null) {
      getPet(widget.id);
    } else {
      controller.alteraLoading(true);
    }

    super.initState();
  }

  Future getPet(int id) async {
    textButton = 'EDITAR';
    var pet = await controller.getPet(id);
    _tipoController = pet.data.tipo;
    _porteController = pet.data.porte;
    _racaController.text = pet.data.raca;
    _nomeController.text = pet.data.nome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: handleSubmit,
            child: Text(textButton, style: AppTextTheme.textActionButton),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => !controller.loadingForm
            ? CircularProgressCustom()
            : Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: DropdownButtonFieldWidget2(
                              label: "Tipo",
                              list: tipos,
                              value: _tipoController,
                              hint: 'Selecione',
                              focusNode: _tipoFocus,
                              onChanged: (v) {
                                _tipoController = v;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: UnderlineTextFieldWidget(
                              labelText: "Raça",
                              controller: _racaController,
                              validator: Validators.empty,
                              keyboardType: TextInputType.name,
                              focusNode: _racaFocus,
                              hint: 'exemplo: Pastor alemão, Bulldog...',
                              onSubmitted: (value) {
                                Focus.of(context).requestFocus(_racaFocus);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: DropdownButtonFieldWidget2(
                              label: "Porte",
                              list: portes,
                              value: _porteController,
                              hint: 'Selecione',
                              focusNode: _porteFocus,
                              onChanged: (v) {
                                _porteController = v;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: UnderlineTextFieldWidget(
                              labelText: "Nome",
                              controller: _nomeController,
                              validator: Validators.empty,
                              keyboardType: TextInputType.name,
                              focusNode: _nomeFocus,
                              hint: 'exemplo: Bidu...',
                              onSubmitted: (value) {
                                Focus.of(context).requestFocus(_nomeFocus);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

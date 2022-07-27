import 'dart:async';

import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/veiculo/veiculo_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_veiculo_controller.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroVeiculoPage extends StatefulWidget {
  final String title;
  final int id;
  const CadastroVeiculoPage(
      {Key key, this.title = "Cadastro de veiculo", this.id})
      : super(key: key);

  @override
  _CadastroVeiculoPageState createState() => _CadastroVeiculoPageState();
}

class _CadastroVeiculoPageState
    extends ModularState<CadastroVeiculoPage, CadastroVeiculoController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _modeloController = TextEditingController();
  final FocusNode _modeloFocus = FocusNode();
  final _anoController = TextEditingController();
  final FocusNode _anoFocus = FocusNode();
  final _placaController = TextEditingController();

  String cor;

  String textButton = 'SALVAR';

  var maskFormatter = MaskTextInputFormatter(mask: 'AAA-#*##', filter: {
    "*": RegExp(r'[0-9 A-Za-z]'),
    "#": RegExp(r'[0-9]'),
    "A": RegExp(r'[A-Za-z]'),
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<String> cores = [
    'Amarelo',
    'Azul',
    'Branco',
    'Cinza',
    'Marrom',
    'Vermelho',
    'Preto',
    'Rosa',
    'Verde',
    'Roxo'
  ];

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  Future<void> handleSubmit() async {
    if (_formKey.currentState.validate()) {
      VeiculoEntity veiculo;
      if (widget.id != null) {
        veiculo = VeiculoEntity(
            id: widget.id,
            modelo: _modeloController.text,
            ano: _anoController.text,
            placa: _placaController.text,
            cor: cor);
      } else {
        veiculo = VeiculoEntity(
            id: widget.id,
            modelo: _modeloController.text,
            ano: _anoController.text,
            placa: _placaController.text,
            cor: cor);
      }

      final r = await controller.createVeiculo(veiculo);

      if (r.status == Status.failed) {
        showInSnackBar(r.message);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          CustomAlertDialog.error(context, r.error.message);
          controller.alteraLoading(false);
        });
      }

      if (r.status == Status.success) {
        showInSnackBar('Veiculo adicionado com sucesso');
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
      getVeiculo(widget.id);
    } else {
      controller.alteraLoading(true);
    }

    super.initState();
  }

  Future getVeiculo(int id) async {
    textButton = 'EDITAR';
    var veiculo = await controller.getVeiculo(id);
    _modeloController.text = veiculo.modelo;
    _anoController.text = veiculo.ano;
    _placaController.text = veiculo.placa;
    cor = veiculo.cor;
  }

  final toUpperCase = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text.length > 0) {
      String text = newValue.text.toUpperCase();
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(
          offset: newValue.selection.end,
        ),
      );
    }
    return newValue;
  });

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
                            child: UnderlineTextFieldWidget(
                              labelText: "Marca/Modelo",
                              controller: _modeloController,
                              validator: Validators.empty,
                              keyboardType: TextInputType.name,
                              focusNode: _modeloFocus,
                              hint: 'marca/modelo',
                              onSubmitted: (value) {
                                Focus.of(context).requestFocus(_modeloFocus);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: UnderlineTextFieldWidget(
                              labelText: "Ano",
                              controller: _anoController,
                              validator: Validators.yearNotEmptyValid,
                              keyboardType: TextInputType.number,
                              focusNode: _anoFocus,
                              maxLength: 4,
                              hint: '',
                              onSubmitted: (value) {
                                Focus.of(context).requestFocus(_anoFocus);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 0),
                            child: UnderlineTextFieldWidget(
                              labelText: "Placa",
                              controller: _placaController,
                              validator: Validators.empty,
                              keyboardType: TextInputType.text,
                              inputFormatters: [maskFormatter, toUpperCase],
                              hint: 'XXX-XXXX',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: DropdownButtonFormField(
                              validator: Validators.empty,
                              value: cor,
                              hint: Text('Selecione a cor'),
                              items: cores.map((e) {
                                return DropdownMenuItem(
                                    child: Text(e), value: e);
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  cor = value;
                                });
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

import 'dart:async';

import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_aviso_page_controller.dart';

class CadastroAvisoPagePage extends StatefulWidget {
  final String title;
  final int condCon;
  final int id;
  const CadastroAvisoPagePage({Key key, this.title = "Adicionar aviso", @required this.condCon, this.id = 0}) : super(key: key);

  @override
  _CadastroAvisoPagePageState createState() => _CadastroAvisoPagePageState();
}

class _CadastroAvisoPagePageState extends ModularState<CadastroAvisoPagePage, CadastroAvisoPageController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _titleController = TextEditingController();
  final _msgController = TextEditingController();

  bool isLoading = false;
  int idAviso = 0;

  @override
  void initState() {
    super.initState();
    if (widget.id != null && widget.id != 0) {
      setLoading(true);
      idAviso = widget.id;
      getAviso();
    }
  }

  getAviso() async {
    await controller.getAviso(idAviso);
    _titleController.text = controller.aviso.att;
    _msgController.text = controller.aviso.descri;
    setLoading(false);
  }

  handleSubmit() async {
    if (_formKey.currentState.validate()) {
      setLoading(true);
      ResourceData r = await controller.createAviso(
        codCon: widget.condCon,
        title: _titleController.text,
        descri: _msgController.text,
        id: idAviso,
      );

      if (r.status == Status.failed) {
        showInSnackBar(r.message);
        setLoading(false);
      } else {
        showInSnackBar(r.message);
        Timer(Duration(seconds: 1), () {
          Modular.navigator.pop();
          setLoading(false);
        });
      }
    }
  }

  setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  void showInSnackBar(String msg) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        title: Text(idAviso == 0 ? widget.title : 'Editar aviso'),
        actions: [
          TextButton(
            onPressed: handleSubmit,
            child: Text(
              idAviso == 0 ? 'SALVAR' : 'ATUALIZAR',
              style: AppTextTheme.textActionButton,
            ),
          ),
        ],
      ),
      body: isLoading
          ? CircularProgressCustom()
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: UnderlineTextFieldWidget(
                      labelText: 'TITÚLO',
                      hint: 'exemplo: Elevador em manutenção...',
                      validator: Validators.empty,
                      controller: _titleController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: UnderlineTextFieldWidget(
                      labelText: 'MENSAGEM',
                      hint: 'exemplo: Prezados(as), o elevador estará em manutenção...',
                      maxLines: 4,
                      validator: Validators.empty,
                      controller: _msgController,
                      keyboardType: TextInputType.name,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

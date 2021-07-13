import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_espaco_controller.dart';

class CadastroEspacoPage extends StatefulWidget {
  final String title;
  const CadastroEspacoPage({Key key, this.title = "Espaço"}) : super(key: key);

  @override
  _CadastroEspacoPageState createState() => _CadastroEspacoPageState();
}

class _CadastroEspacoPageState
    extends ModularState<CadastroEspacoPage, CadastroEspacoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        actions: [
          TextButton(
            onPressed: () =>
                Modular.navigator.pushNamed(RouteName.cadastro_espaco),
            child: Text('SALVAR', style: AppTextTheme.textActionButton),
          ),
        ],
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              UnderlineTextFieldWidget(
                hint: 'Ex: Salão de Festas',
                labelText: 'Nome*',
                keyboardType: TextInputType.name,
              ),
              UnderlineTextFieldWidget(
                hint: 'Ex: 20',
                labelText: 'Capacidade Máxima*',
                keyboardType: TextInputType.number,
              ),
              Container(
                  height: 5 * 18.0,
                  child: UnderlineTextFieldWidget(
                    maxLines: 5,
                    labelText: 'Observações/Regulamento',
                  )),
            ],
          )),
    );
  }
}

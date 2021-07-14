import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/sindico/component/menu_tempo_espaco_widget.dart';
import 'package:Gestart/app/modules/sindico/component/menu_tempo_intervalo_espaco_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';

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
  final _nomeController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _observacaoController = TextEditingController();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

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
        body: Observer(
          builder: (_) => controller.horarios.status == Status.loading
              ? CircularProgressCustom()
              : SingleChildScrollView(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 8, right: 8, bottom: 12),
                              child: Column(
                                children: [
                                  UnderlineTextFieldWidget(
                                    hint: 'Ex: Salão de Festas',
                                    labelText: 'Nome*',
                                    keyboardType: TextInputType.name,
                                    controller: _nomeController,
                                  ),
                                  UnderlineTextFieldWidget(
                                    hint: 'Ex: 20',
                                    labelText: 'Capacidade Máxima*',
                                    keyboardType: TextInputType.number,
                                    controller: _capacidadeController,
                                  ),
                                  Container(
                                      height: 5 * 18.0,
                                      child: UnderlineTextFieldWidget(
                                        maxLines: 5,
                                        labelText: 'Observações/Regulamento',
                                        controller: _observacaoController,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 8, right: 8, bottom: 12),
                              child: Column(
                                children: [
                                  LinhaDropdownWidget(
                                    controller: controller,
                                    descricao: 'Tempo mínimo de permanência',
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: controller.setMinPer,
                                  ),
                                  Divider(),
                                  LinhaDropdownWidget(
                                    controller: controller,
                                    descricao: 'Tempo máximo de permanência*',
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: controller.setMaxPer,
                                  ),
                                  Divider(),
                                  LinhaDropdownWidget(
                                    controller: controller,
                                    descricao:
                                        'Antecedência mínima para reserva*',
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: controller.setMinAnt,
                                  ),
                                  Divider(),
                                  LinhaDropdownWidget(
                                    controller: controller,
                                    descricao:
                                        'Antecedência máxima para reserva*',
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: controller.setMaxAnt,
                                  ),
                                  Divider(),
                                  LinhaDropdownWidget(
                                    controller: controller,
                                    descricao: 'Intervalo entre reservas*',
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: controller.setIntRes,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 8, right: 8, bottom: 12),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'DOM',
                                          style: TextStyle(
                                              fontSize: 26.sp,
                                              fontFamily: 'roboto',
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.normal),
                                        ),
                                        Container(
                                          child: DropdownButton(
                                              value: controller
                                                  .horarios.data[1].id,
                                              items: controller.horarios.data
                                                  .map((e) {
                                                return DropdownMenuItem(
                                                  child: Text(e.descricao),
                                                  value: e.id,
                                                );
                                              }).toList(),
                                              onChanged: controller.ativarDom
                                                  ? (_) => print('')
                                                  : null),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                            child: DropdownButton(
                                                value: controller
                                                    .horarios.data[1].id,
                                                items: controller.horarios.data
                                                    .map((e) {
                                                  return DropdownMenuItem(
                                                    child: Text(e.descricao),
                                                    value: e.id,
                                                  );
                                                }).toList(),
                                                onChanged: controller.ativarDom
                                                    ? (_) => print('')
                                                    : null)),
                                        Switch(
                                            value: controller.ativarDom,
                                            activeColor:
                                                AppColorScheme.primaryColor,
                                            onChanged: (_) =>
                                                controller.statusDom())
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  MenuIntervaloEspacoWidget(
                                    descricao: 'SEG',
                                    listaValores: controller.horarios.data,
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: (_) => print('teste'),
                                    ativo: false,
                                  ),
                                  Divider(),
                                  MenuIntervaloEspacoWidget(
                                    descricao: 'TER',
                                    listaValores: controller.horarios.data,
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: (_) => print('teste'),
                                  ),
                                  Divider(),
                                  MenuIntervaloEspacoWidget(
                                    descricao: 'QUA',
                                    listaValores: controller.horarios.data,
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: (_) => print('teste'),
                                  ),
                                  Divider(),
                                  MenuIntervaloEspacoWidget(
                                    descricao: 'QUI',
                                    listaValores: controller.horarios.data,
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: (_) => print('teste'),
                                  ),
                                  Divider(),
                                  MenuIntervaloEspacoWidget(
                                    descricao: 'SEX',
                                    listaValores: controller.horarios.data,
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: (_) => print('teste'),
                                  ),
                                  Divider(),
                                  MenuIntervaloEspacoWidget(
                                    descricao: 'SAB',
                                    listaValores: controller.horarios.data,
                                    valorInicial:
                                        controller.horarios.data[1].id,
                                    acao: (_) => print('teste'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 8, right: 8, bottom: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            'É necessária aprovação do responsavel para eventos que ocorrerão neste espaço?*'),
                                      ),
                                      Switch(
                                          value: true,
                                          activeColor:
                                              AppColorScheme.primaryColor,
                                          onChanged: (_) => print('teste')),
                                    ],
                                  ),
                                  Divider(
                                    color: AppColorScheme.black,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            'Apenas proprietário pode reservar?*'),
                                      ),
                                      Switch(
                                          value: true,
                                          activeColor:
                                              AppColorScheme.primaryColor,
                                          onChanged: (_) =>
                                              print(_nomeController.text)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButtonWidget(
                              onPressed: () => print(_nomeController.text),
                              text: 'SALVAR',
                              cor: AppColorScheme.primaryColor)
                        ],
                      )),
                ),
        ));
  }
}

class LinhaDropdownWidget extends StatelessWidget {
  const LinhaDropdownWidget({
    Key key,
    this.descricao,
    @required this.controller,
    this.variavel,
    this.acao,
    this.valorInicial,
  }) : super(key: key);
  final String descricao;
  final int variavel;
  final int valorInicial;
  final Function acao;

  final CadastroEspacoController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          descricao,
          style: TextStyle(
              fontSize: 26.sp,
              fontFamily: 'roboto',
              color: Colors.grey[600],
              fontStyle: FontStyle.normal),
        )),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: DropdownButtonFormField(
              value: valorInicial,
              items: controller.horarios.data.map((e) {
                return DropdownMenuItem(
                  child: Text(e.descricao),
                  value: e.id,
                );
              }).toList(),
              onChanged: acao),
        ),
      ],
    );
  }
}

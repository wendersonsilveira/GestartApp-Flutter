import 'dart:async';

import 'package:Gestart/app/modules/sindico/component/config_horario_dia_widget.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _observacaoIniController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  criarEspaco() async {
    if (controller.checarValores() == null) {
      if (_formKey.currentState.validate()) {
        final result = await controller.enviarParametros(_nomeController.text,
            _capacidadeController.text, _observacaoIniController.text);

        if (result.status == Status.success) {
          UIHelper.showInSnackBar(
            'Espaço adicionado com sucesso',
            _scaffoldKey,
          );
          Timer(Duration(seconds: 1), () {
            Navigator.popUntil(
                context, ModalRoute.withName(RouteName.listarEspacos));
          });
        }
      }
    } else
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        CustomAlertDialog.error(context, controller.checarValores());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarCustom(
          context,
          actions: [
            TextButton(
              onPressed: () => criarEspaco(),
              child: Text('SALVAR', style: AppTextTheme.textActionButton),
            ),
          ],
          title: Text(widget.title),
        ),
        body: Observer(
          builder: (_) => controller.horarios.status == Status.loading
              ? CircularProgressCustom()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 8, right: 8, bottom: 12),
                                child: Column(
                                  children: [
                                    UnderlineTextFieldWidget(
                                      hint: 'Ex: Salão de Festas',
                                      labelText: 'Nome*',
                                      keyboardType: TextInputType.name,
                                      validator: Validators.empty,
                                      controller: _nomeController,
                                    ),
                                    UnderlineTextFieldWidget(
                                      hint: 'Ex: 20',
                                      labelText: 'Capacidade Máxima*',
                                      keyboardType: TextInputType.number,
                                      validator: Validators.empty,
                                      controller: _capacidadeController,
                                    ),
                                    Container(
                                        height: 5 * 18.0,
                                        child: UnderlineTextFieldWidget(
                                          maxLines: 5,
                                          labelText: 'Observações/Regulamento',
                                          validator: Validators.maxCaracteres,
                                          controller: _observacaoIniController,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 8, right: 8, bottom: 12),
                          child: Form(
                            key: _formKey2,
                            child: Column(
                              children: [
                                LinhaDropdownWidget(
                                  controller: controller,
                                  descricao: 'Tempo mínimo de permanência',
                                  valorInicial: controller.tempoMinPermanencia,
                                  acaoIni: controller.setMinPer,
                                ),
                                Divider(),
                                LinhaDropdownWidget(
                                  controller: controller,
                                  descricao: 'Tempo máximo de permanência*',
                                  valorInicial: controller.tempoMaxPermanencia,
                                  acaoIni: controller.setMaxPer,
                                ),
                                Divider(),
                                LinhaDropdownWidget(
                                  controller: controller,
                                  descricao:
                                      'Antecedência mínima para reserva*',
                                  valorInicial: controller.tempoMinAntecedencia,
                                  acaoIni: controller.setMinAnt,
                                ),
                                Divider(),
                                LinhaDropdownWidget(
                                  controller: controller,
                                  descricao:
                                      'Antecedência máxima para reserva*',
                                  valorInicial: controller.tempoMaxPermanencia,
                                  acaoIni: controller.setMaxAnt,
                                ),
                                Divider(),
                                LinhaDropdownWidget(
                                  controller: controller,
                                  descricao: 'Intervalo entre reservas*',
                                  valorInicial:
                                      controller.tempoIntervaloReserva,
                                  acaoIni: controller.setIntRes,
                                ),
                              ],
                            ),
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
                                    ConfigHorarioDiaWidget(
                                      controller: controller,
                                      status: controller.ativarDom,
                                      dia: 'DOM',
                                      valorInicial: controller.domIni,
                                      valorFim: controller.domFim,
                                      acaoIni: controller.setHorarioDomIni,
                                      acaoFim: controller.setHorarioDomFim,
                                    ),
                                    Switch(
                                        value: controller.ativarDom,
                                        activeColor:
                                            AppColorScheme.primaryColor,
                                        onChanged: (_) =>
                                            controller.statusDom())
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConfigHorarioDiaWidget(
                                      controller: controller,
                                      dia: 'SEG',
                                      status: controller.ativarSeg,
                                      valorInicial: controller.segIni,
                                      valorFim: controller.segFim,
                                      acaoIni: controller.setHorarioSegIni,
                                      acaoFim: controller.setHorarioSegFim,
                                    ),
                                    Switch(
                                        value: controller.ativarSeg,
                                        activeColor:
                                            AppColorScheme.primaryColor,
                                        onChanged: (_) =>
                                            controller.statusSeg())
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConfigHorarioDiaWidget(
                                      controller: controller,
                                      dia: 'TER',
                                      status: controller.ativarTer,
                                      valorInicial: controller.terIni,
                                      valorFim: controller.terFim,
                                      acaoIni: controller.setHorarioTerIni,
                                      acaoFim: controller.setHorarioTerFim,
                                    ),
                                    Switch(
                                        value: controller.ativarTer,
                                        activeColor:
                                            AppColorScheme.primaryColor,
                                        onChanged: (_) =>
                                            controller.statusTer())
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConfigHorarioDiaWidget(
                                      controller: controller,
                                      dia: 'QUA',
                                      status: controller.ativarQua,
                                      valorInicial: controller.quaIni,
                                      valorFim: controller.quaFim,
                                      acaoIni: controller.setHorarioQuaIni,
                                      acaoFim: controller.setHorarioQuaFim,
                                    ),
                                    Switch(
                                        value: controller.ativarQua,
                                        activeColor:
                                            AppColorScheme.primaryColor,
                                        onChanged: (_) =>
                                            controller.statusQua())
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConfigHorarioDiaWidget(
                                      controller: controller,
                                      dia: 'QUI',
                                      status: controller.ativarQui,
                                      valorInicial: controller.quiIni,
                                      valorFim: controller.quiFim,
                                      acaoIni: controller.setHorarioQuiIni,
                                      acaoFim: controller.setHorarioQuiFim,
                                    ),
                                    Switch(
                                        value: controller.ativarQui,
                                        activeColor:
                                            AppColorScheme.primaryColor,
                                        onChanged: (_) =>
                                            controller.statusQui())
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConfigHorarioDiaWidget(
                                      controller: controller,
                                      dia: 'SEX',
                                      status: controller.ativarSex,
                                      valorInicial: controller.sexIni,
                                      valorFim: controller.sexFim,
                                      acaoIni: controller.setHorarioSexIni,
                                      acaoFim: controller.setHorarioSexFim,
                                    ),
                                    Switch(
                                        value: controller.ativarSex,
                                        activeColor:
                                            AppColorScheme.primaryColor,
                                        onChanged: (_) =>
                                            controller.statusSex())
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConfigHorarioDiaWidget(
                                      controller: controller,
                                      dia: 'SAB',
                                      status: controller.ativarSab,
                                      valorInicial: controller.sabIni,
                                      valorFim: controller.sabFim,
                                      acaoIni: controller.setHorarioSabIni,
                                      acaoFim: controller.setHorarioSabFim,
                                    ),
                                    Switch(
                                        value: controller.ativarSab,
                                        activeColor:
                                            AppColorScheme.primaryColor,
                                        onChanged: (_) =>
                                            controller.statusSab())
                                  ],
                                ),
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
                                      value: controller.autorizacaoResponsavel,
                                      activeColor: AppColorScheme.primaryColor,
                                      onChanged: (_) => controller
                                          .statusAutorizacaoResponsavel()),
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
                                      value:
                                          controller.apenasProprietarioReserva,
                                      activeColor: AppColorScheme.primaryColor,
                                      onChanged: (_) => controller
                                          .statusapenasProprietarioReserva()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButtonWidget(
                            onPressed: () => criarEspaco(),
                            text: 'SALVAR',
                            cor: AppColorScheme.primaryColor),
                      )
                    ],
                  ),
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
    this.acaoIni,
    this.valorInicial,
  }) : super(key: key);
  final String descricao;
  final int variavel;
  final int valorInicial;
  final Function acaoIni;

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
              onChanged: acaoIni),
        ),
      ],
    );
  }
}

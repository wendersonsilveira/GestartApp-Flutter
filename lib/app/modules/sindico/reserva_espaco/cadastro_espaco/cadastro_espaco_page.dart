import 'dart:async';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/sindico/component/config_horario_widget.dart';
import 'package:Gestart/app/modules/sindico/component/drop_validator_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/utils/validators.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:Gestart/app/widgets/inputs/underline_text_field_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cadastro_espaco_controller.dart';

class CadastroEspacoPage extends StatefulWidget {
  final String title;
  final int id;
  const CadastroEspacoPage(
      {Key key, this.title = "Cadastro de Espaços", this.id})
      : super(key: key);

  @override
  _CadastroEspacoPageState createState() => _CadastroEspacoPageState();
}

class _CadastroEspacoPageState
    extends ModularState<CadastroEspacoPage, CadastroEspacoController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init();
    if (widget.id != null)
      controller.getEspaco(widget.id).then((value) {
        _nomeController.text = value.data.descricao;
        _capacidadeController.text = value.data.capacidade.toString();
        _observacaoIniController.text = value.data.obs;
      });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _capacidadeController = TextEditingController();
  final _observacaoIniController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  criarEspaco() async {
    if (_formKey.currentState.validate()) {
      final result = await controller.enviarParametros(_nomeController.text,
          _capacidadeController.text, _observacaoIniController.text, widget.id);

      if (result.status == Status.success) {
        String message = widget.id != null
            ? 'Espaço alterado com sucesso'
            : 'Espaço adicionado com sucesso';
        UIHelper.showInSnackBar(
          message,
          _scaffoldKey,
        );
        Timer(Duration(seconds: 1), () {
          // Modular.navigator.pop();
          Navigator.popUntil(
              context, ModalRoute.withName(RouteName.listar_espacos));
        });
      }
    }
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
        body: Observer(builder: (_) {
          switch (controller.horarios.status) {
            case Status.success:
              return SingleChildScrollView(
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
                                  padding: EdgeInsets.only(
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
                                            labelText:
                                                'Observações/Regulamento',
                                            validator: Validators.maxCaracteres,
                                            controller:
                                                _observacaoIniController,
                                          )),
                                    ],
                                  ))),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 0, left: 8, right: 8, bottom: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Tempo mínimo de permanência',
                                          style: TextStyle(
                                              fontSize: 26.sp,
                                              fontFamily: 'roboto',
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      Expanded(
                                          child: DropDownValidator(
                                              lista: controller.horarios.data,
                                              onChange: (value) => {
                                                    controller.setMinPer(value),
                                                  },
                                              value: controller
                                                  .tempoMinPermanencia,
                                              validator: (value) {
                                                if (controller
                                                        .tempoMinPermanencia >=
                                                    controller
                                                        .tempoMaxPermanencia) {
                                                  return 'Permanência miníma não pode ser maior ou igual a máxima';
                                                }
                                              }))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Tempo máximo de permanência*',
                                          style: TextStyle(
                                              fontSize: 26.sp,
                                              fontFamily: 'roboto',
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      Expanded(
                                          child: DropDownValidator(
                                              lista: controller.horarios.data,
                                              onChange: (value) => {
                                                    controller.setMaxPer(value),
                                                  },
                                              value: controller
                                                  .tempoMaxPermanencia,
                                              validator: (value) {
                                                if (controller
                                                        .tempoMinPermanencia >=
                                                    controller
                                                        .tempoMaxPermanencia) {
                                                  return 'Permanência máxima não pode ser menor ou igual a mínima';
                                                }
                                              }))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Antecedência mínima para reserva*',
                                          style: TextStyle(
                                              fontSize: 26.sp,
                                              fontFamily: 'roboto',
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      Expanded(
                                          child: DropDownValidator(
                                              lista: controller.horarios.data,
                                              onChange: (value) => {
                                                    controller.setMinAnt(value),
                                                  },
                                              value: controller
                                                  .tempoMinAntecedencia,
                                              validator: (value) {
                                                if (controller
                                                        .tempoMinAntecedencia >=
                                                    controller
                                                        .tempoMaxAntecedencia) {
                                                  return 'Antecedencia mínima não pode ser maior ou igual a máxima';
                                                }
                                              }))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Antecedência máxima para reserva*',
                                          style: TextStyle(
                                              fontSize: 26.sp,
                                              fontFamily: 'roboto',
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      Expanded(
                                          child: DropDownValidator(
                                              lista: controller.horarios.data,
                                              onChange: (value) => {
                                                    controller.setMaxAnt(value),
                                                  },
                                              value: controller
                                                  .tempoMaxAntecedencia,
                                              validator: (value) {
                                                if (controller
                                                        .tempoMinAntecedencia >=
                                                    controller
                                                        .tempoMaxAntecedencia) {
                                                  return 'Antecedencia máxima não pode ser menor ou igual a mínima';
                                                }
                                              }))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Intervalo entre reservas*',
                                          style: TextStyle(
                                              fontSize: 26.sp,
                                              fontFamily: 'roboto',
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      Expanded(
                                          child: DropDownValidator(
                                        lista: controller.horarios.data,
                                        onChange: (value) => {
                                          controller.setIntRes(value),
                                        },
                                        value: controller.tempoIntervaloReserva,
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 8, right: 8, bottom: 12),
                                  child: Column(children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ConfigHorarioDiaWidget(
                                            controller: controller,
                                            dia: 'DOM',
                                            status: controller.ativarDom,
                                            valorInicial: controller.domIni,
                                            valorFim: controller.domFim,
                                            acaoIni:
                                                controller.setHorarioDomIni,
                                            acaoFim:
                                                controller.setHorarioDomFim,
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
                                            acaoIni:
                                                controller.setHorarioSegIni,
                                            acaoFim:
                                                controller.setHorarioSegFim,
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
                                            acaoIni:
                                                controller.setHorarioTerIni,
                                            acaoFim:
                                                controller.setHorarioTerFim,
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
                                            acaoIni:
                                                controller.setHorarioQuaIni,
                                            acaoFim:
                                                controller.setHorarioQuaFim,
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
                                            acaoIni:
                                                controller.setHorarioQuiIni,
                                            acaoFim:
                                                controller.setHorarioQuiFim,
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
                                            acaoIni:
                                                controller.setHorarioSexIni,
                                            acaoFim:
                                                controller.setHorarioSexFim,
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
                                          dia: 'SÁB',
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
                                    )),
                                  ]))),
                          Card(
                              child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 8, right: 8, bottom: 12),
                            child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          'É necessária aprovação do responsavel para eventos que ocorrerão neste espaço?*')),
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
                            ]),
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButtonWidget(
                          onPressed: () => criarEspaco(),
                          text: 'SALVAR',
                          cor: AppColorScheme.primaryColor),
                    )
                  ]));
              break;
            case Status.loading:
              return CircularProgressCustom();
            default:
              return Text('sjdjsdkh');
          }
        }));
  }
}

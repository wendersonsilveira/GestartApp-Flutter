import 'dart:async';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'components/infor_config_wiget.dart';
import 'horarios_controller.dart';

class HorariosPage extends StatefulWidget {
  final String title;
  final int espacoId;
  final int codord;

  const HorariosPage({
    Key key,
    this.title = "Nova reserva - Horários",
    this.espacoId,
    this.codord,
  }) : super(key: key);

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState
    extends ModularState<HorariosPage, HorariosController> {
  // CalendarController _calendarController = CalendarController();

  DateTime now = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  var r;
  @override
  void initState() {
    controller.getEspaco(widget.espacoId);
    controller.setCodOrd(widget.codord);
    showConfigEspaco(context);
    super.initState();
  }

  checarPermanencia() async {
    controller.setLoadingPerm(true);
    controller.setMsgErro(null);
    final per = await controller.salvarHorario();
    if (per == null) {
      controller.criarJSONReserva();
      controller.setLoadingPerm(false);
      openDialogInfo();
    } else {
      controller.setLoadingPerm(false);
      controller.setMsgErro(per);
    }
  }

  showConfigEspaco(BuildContext context) {
    Timer(
        Duration(seconds: 1),
        () => {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Observer(
                      builder: (_) => controller.espaco != null
                          ? AlertDialog(
                              title: Center(
                                  child: Text('Regras: ' +
                                      controller.espaco.descricao)),
                              content: Container(
                                height: 300,
                                child: Column(children: [
                                  Divider(),
                                  InforConfigWidget(
                                    descricao: 'Permanência mínima:',
                                    horario: controller.espaco.perMin,
                                  ),
                                  InforConfigWidget(
                                    descricao: 'Permanência máxima:',
                                    horario: controller.espaco.perMax,
                                  ),
                                  InforConfigWidget(
                                    descricao: 'Antecedência mínima:',
                                    horario: controller.espaco.antMin,
                                  ),
                                  InforConfigWidget(
                                      descricao: 'Antecedência máxima:',
                                      horario: controller.espaco.antMax),
                                  InforConfigWidget(
                                    descricao: 'Intervalo entre reservas:',
                                    horario: controller.espaco.intRes,
                                  ),
                                ]),
                              ),
                              actions: [
                                OutlinedButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Modular.to.pop();
                                  },
                                ),
                              ],
                            )
                          : CircularProgressCustom());
                },
              )
            });
  }

  openDialogInfo() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Regras e orientações sobre o espaço que está sendo reservando',
          softWrap: true,
        ),
        content: Observer(
          builder: (_) => Container(
            height: 70,
            child: Column(
              children: [Text(controller.espaco.obs)],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Modular.to.pop(),
            child: const Text(
              'CANCELAR',
              style: TextStyle(color: AppColorScheme.feedbackDangerBase),
            ),
          ),
          TextButton(
            onPressed: () {
              Modular.to.pushNamed(RouteName.reservaCadastro,
                  arguments: controller.reserva);
            },
            child: const Text('CONCORDO'),
          ),
        ],
      ),
    );
  }

  openDialogHorario(int hIni, int hFim) async {
    controller.setHorarioIn(hIni);
    controller.setHorarioFi(hFim);
    await controller.criarHorariosDisponiveis();

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Selecione o horário'),
        content: Observer(
          builder: (_) => Container(
            height: 150,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Início')),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: controller.horariosDisponiveis.length > 0
                            ? controller.horariosDisponiveis.first.id
                            : 0,
                        items: controller.horariosDisponiveis.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.descricao),
                            value: e.id,
                          );
                        }).toList(),
                        onChanged: (int value) {
                          controller.setHorarioIn(value);
                          // controller.setHorarioFi(value >= controller.horaFi
                          //     ? controller.horariosDisponiveis.last.id
                          //     : controller.horaFi);
                          controller.setHorariosFinal();
                          controller.setMsgErro(null);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Fim')),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: controller.horaFi,
                          items: controller.horariosFinal.length > 0
                              ? controller.horariosFinal.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e.descricao),
                                    value: e.id,
                                  );
                                }).toList()
                              : controller.horariosDisponiveis.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e.descricao),
                                    value: e.id,
                                  );
                                }).toList(),
                          onChanged: (int value) {
                            controller.setHorarioFi(value);
                            controller.setMsgErro(null);
                          }),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: controller.checkingPerm
                            ? CircularProgressCustom()
                            : controller.erroMsg == null
                                ? Text('')
                                : Text(
                                    controller.erroMsg,
                                    softWrap: true,
                                    style: TextStyle(
                                        color:
                                            AppColorScheme.feedbackDangerBase,
                                        fontSize: 14),
                                  ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              controller.setMsgErro(null);
              controller.zerarHorarioFinal();
              Modular.to.pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: checarPermanencia,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  bool checkDay(DateTime date) {
    if (date.isAfter(now)) {
      String dayPrefix = DateFormat('EEE', 'pt_BR').format(date);
      dayPrefix = dayPrefix.toUpperCase().replaceAll(r'Á', 'A');
      return controller.espacoJSON[dayPrefix];
    } else {
      if ((date.day.toString() + date.month.toString()) ==
          (now.day.toString() + now.month.toString())) {
        return true;
      }
      return false;
    }
  }

  DateTime _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        actions: [
          TextButton(
              onPressed: () {
                showConfigEspaco(context);
              },
              child: Icon(
                Icons.settings,
                color: AppColorScheme.white,
              ))
        ],
      ),
      body: Observer(
        builder: (_) => Column(
          children: <Widget>[
            controller.espacoJSON != null
                ? TableCalendar(
                    firstDay: now,
                    lastDay: DateTime.utc(2099, 3, 14),
                    locale: 'pt_BR',
                    enabledDayPredicate: checkDay,
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.getHorariosEspaco(selectedDay);
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    headerStyle: HeaderStyle(
                        formatButtonVisible: false, titleCentered: true),
                    calendarStyle: CalendarStyle(
                      todayDecoration:
                          BoxDecoration(color: AppColorScheme.secondaryColor),
                      selectedDecoration:
                          BoxDecoration(color: AppColorScheme.primaryColor),
                    ),
                    focusedDay:
                        _focusedDay == null ? DateTime.now() : _focusedDay)
                // onDaySelected: (data, focusedDay) {
                //   controller.getHorariosEspaco(data);
                //   setState(() {
                //     _selectedDay = data;
                //     now = focusedDay;
                //   });
                // })
                // ? TableCalendar(
                //     focusedDay: DateTime.now(),
                //     firstDay: null,
                //     lastDay: null,
                //     locale: 'pt_BR',
                //     enabledDayPredicate: checkDay,
                //     headerStyle: HeaderStyle(
                //         formatButtonVisible: false, titleCentered: true),
                //     calendarStyle: CalendarStyle(
                //       todayDecoration:
                //           BoxDecoration(color: AppColorScheme.secondaryColor),
                //       selectedDecoration:
                //           BoxDecoration(color: AppColorScheme.primaryColor),
                //     ),
                //     onDaySelected: (data, focusedDay) =>
                //         controller.getHorariosEspaco(data),
                //   )
                // TableCalendar(
                //     calendarController: _calendarController,
                //     locale: 'pt_BR',
                //     initialCalendarFormat: CalendarFormat.month,
                //     enabledDayPredicate: checkDay,
                //     headerStyle: HeaderStyle(
                //       formatButtonVisible: false,
                //       centerHeaderTitle: true,
                //     ),
                //     calendarStyle: CalendarStyle(
                //       todayColor: AppColorScheme.secondaryColor,
                //       selectedColor: AppColorScheme.primaryColor,
                //     ),
                //     onDaySelected: (data, b, c) =>
                //         controller.getHorariosEspaco(data),
                //   )
                : CircularProgressCustom(),
            Observer(
                builder: (_) => controller.horarios == null
                    ? controller.isLoading
                        ? Expanded(child: CircularProgressCustom())
                        : Container(child: null)
                    : controller.isLoading
                        ? Expanded(child: CircularProgressCustom())
                        : controller.horarios.length > 0
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: controller.horarios.length,
                                  itemBuilder: (con, index) => Card(
                                    child: ListTile(
                                      title: Text(
                                          '${controller.horarios[index].horIniDescricao} - ${controller.horarios[index].horfimDescricao}'),
                                      leading: Icon(
                                        controller.horarios[index].reservaId > 0
                                            ? Icons.alarm_off
                                            : Icons.alarm,
                                        color: controller
                                                    .horarios[index].reservaId >
                                                0
                                            ? AppColorScheme.feedbackDangerDark
                                            : AppColorScheme.primaryColor,
                                      ),
                                      trailing:
                                          controller.horarios[index].reservaId >
                                                  0
                                              ? OutlineButton(
                                                  child: Text(
                                                    'Reservado',
                                                    style: TextStyle(
                                                        color: AppColorScheme
                                                            .feedbackDangerDark),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: AppColorScheme
                                                          .feedbackDangerDark),
                                                  onPressed: () =>
                                                      print('Reservado'),
                                                )
                                              : OutlineButton(
                                                  child: Text('Selecionar',
                                                      style: TextStyle(
                                                        color: AppColorScheme
                                                            .primaryColor,
                                                      )),
                                                  borderSide: BorderSide(
                                                      color: AppColorScheme
                                                          .primaryColor),
                                                  onPressed: () =>
                                                      openDialogHorario(
                                                          controller
                                                              .horarios[index]
                                                              .horiniId,
                                                          controller
                                                              .horarios[index]
                                                              .horfimId)),
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.alarm_off,
                                        size: 70,
                                        color: AppColorScheme.primaryColor,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text('Não há horários para reservas.'),
                                    ],
                                  ),
                                ),
                              )),
          ],
        ),
      ),
    );
  }
}

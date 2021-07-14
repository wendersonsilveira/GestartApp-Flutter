import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';
import 'horarios_controller.dart';

class HorariosPage extends StatefulWidget {
  final String title;
  final int espacoId;
  final int codord;

  const HorariosPage({
    Key key,
    this.title = "Nova reserva - Horarios",
    this.espacoId,
    this.codord,
  }) : super(key: key);

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends ModularState<HorariosPage, HorariosController> {
  CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    controller.getEspaco(widget.espacoId);
    controller.setCodOrd(widget.codord);
    super.initState();
  }

  checarPermanencia() async {
    controller.setLoaginPerm(true);
    controller.setMsgErro(null);
    final per = await controller.salvarHorario();
    if (per == null) {
      controller.criarJSONReserva();
      controller.setLoaginPerm(false);
      openDialogInfo();
    } else {
      controller.setLoaginPerm(false);
      controller.setMsgErro(per);
    }
  }

  openDialogInfo() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Regras e orientações sobre o espaço que está reservando',
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
            onPressed: () => Modular.navigator.pop(),
            child: const Text(
              'CANCELAR',
              style: TextStyle(color: AppColorScheme.feedbackDangerBase),
            ),
          ),
          TextButton(
            onPressed: () {
              Modular.navigator.pushNamed(RouteName.reservaCadastro, arguments: controller.reserva);
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
                        value: controller.horariosDisponiveis.length > 0 ? controller.horariosDisponiveis.first.id : 0,
                        items: controller.horariosDisponiveis.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.descricao),
                            value: e.id,
                          );
                        }).toList(),
                        onChanged: (int value) {
                          controller.setHorarioIn(value);
                          controller.setHorarioFi(value >= controller.horaFi ? controller.horariosDisponiveis.last.id : controller.horaFi);
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
                                    style: TextStyle(color: AppColorScheme.feedbackDangerBase, fontSize: 14),
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
              Modular.navigator.pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TableCalendar(
            calendarController: _calendarController,
            locale: 'pt_BR',
            initialCalendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              centerHeaderTitle: true,
            ),
            calendarStyle: CalendarStyle(
              todayColor: AppColorScheme.secondaryColor,
              selectedColor: AppColorScheme.primaryColor,
            ),
            onDaySelected: (data, b, c) => controller.getHorariosEspaco(data),
          ),
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
                                    title: Text('${controller.horarios[index].horIniDescricao} - ${controller.horarios[index].horfimDescricao}'),
                                    leading: Icon(
                                      controller.horarios[index].reservaId > 0 ? Icons.alarm_off : Icons.alarm,
                                      color: controller.horarios[index].reservaId > 0 ? AppColorScheme.feedbackDangerDark : AppColorScheme.primaryColor,
                                    ),
                                    trailing: controller.horarios[index].reservaId > 0
                                        ? OutlineButton(
                                            child: Text(
                                              'Reservado',
                                              style: TextStyle(color: AppColorScheme.feedbackDangerDark),
                                            ),
                                            borderSide: BorderSide(color: AppColorScheme.feedbackDangerDark),
                                            onPressed: () => print('Reservado'),
                                          )
                                        : OutlineButton(
                                            child: Text('Disponível',
                                                style: TextStyle(
                                                  color: AppColorScheme.primaryColor,
                                                )),
                                            borderSide: BorderSide(color: AppColorScheme.primaryColor),
                                            onPressed: () => openDialogHorario(controller.horarios[index].horiniId, controller.horarios[index].horfimId)),
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
    );
  }
}

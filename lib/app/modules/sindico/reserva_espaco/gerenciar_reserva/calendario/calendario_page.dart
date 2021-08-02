import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendario_controller.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/constants/route_name.dart';

class CalendarioPage extends StatefulWidget {
  final String title;
  const CalendarioPage({Key key, this.title = "Calendario"}) : super(key: key);

  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState
    extends ModularState<CalendarioPage, CalendarioController> {
  //use 'controller' variable to access controller
  CalendarController _calendarController = CalendarController();
  DateTime now = DateTime.now();
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  selecionarDia(DateTime date) {
    controller.inserirReservasDia(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => controller.r.status == Status.loading
            ? CircularProgressCustom()
            : Column(
                children: [
                  TableCalendar(
                    calendarController: _calendarController,
                    locale: 'pt_BR',
                    initialCalendarFormat: CalendarFormat.month,
                    events: controller.eventos,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      centerHeaderTitle: true,
                    ),
                    calendarStyle: CalendarStyle(
                      todayColor: AppColorScheme.secondaryColor,
                      eventDayStyle: TextStyle(
                        color: Colors.indigoAccent[400],
                      ),
                      selectedColor: AppColorScheme.primaryColor,
                    ),
                    onDaySelected: (data, b, c) => selecionarDia(data),
                  ),
                  controller.reservaAdmDia.length == 0
                      ? Container()
                      : Container(
                          child: Expanded(
                            child: ListView.builder(
                              itemCount: controller.reservaAdmDia.length,
                              itemBuilder: (con, index) => Card(
                                  child: ListTile(
                                onTap: () => Modular.navigator.pushNamed(
                                    RouteName.detalhes_reserva,
                                    arguments: controller.reservaAdmDia[index]),
                                leading: Icon(
                                  Icons.alarm,
                                  color: AppColorScheme.primaryColor,
                                ),
                                title: Text(
                                    controller.reservaAdmDia[index].apelido),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Uni: ${controller.reservaAdmDia[index].codimo}'),
                                    Text(
                                        '${UIHelper.formatDate(controller.reservaAdmDia[index].data)} | ${controller.reservaAdmDia[index].horIniDescricao} - ${controller.reservaAdmDia[index].horFimDescricao}')
                                  ],
                                ),
                              )),
                            ),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}

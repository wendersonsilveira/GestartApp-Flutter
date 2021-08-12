import 'dart:math';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'assembleia_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/subtitle_widget.dart';
import 'components/title_widget.dart';

class AssembleiaPage extends StatefulWidget {
  final String title;

  const AssembleiaPage({Key key, this.title = "Assembleia"}) : super(key: key);

  @override
  _AssembleiaPageState createState() => _AssembleiaPageState();
}

class _AssembleiaPageState
    extends ModularState<AssembleiaPage, AssembleiaController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  Future refreshList() {
    return controller.getEditais();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Observer(builder: (_) {
        switch (controller.condominios.status) {
          case Status.loading:
            return CircularProgressCustom();
            break;
          case Status.success:
            return Column(
              children: [
                Container(
                  height: 110.h,
                  child: DropdownButtonFieldWidget(
                    label: 'Condomínios',
                    hint: 'Selecione',
                    list: controller.condominios.data,
                    value: controller.codCon,
                    onChanged: (value) {
                      controller.changeDropdown(value);
                    },
                  ),
                ),
                Expanded(
                  child: controller.listaView.length == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.subtitles_off,
                              size: 70,
                              color: AppColorScheme.primaryColor,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text('Nenhuma assembleia disponível'),
                          ],
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                          child: RefreshIndicator(
                            onRefresh: refreshList,
                            child: ListView.builder(
                                itemCount: 1,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      controller.editaisProximos.length == 0
                                          ? Container()
                                          : Card(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'PRÓXIMA',
                                                      style: TextStyle(
                                                        fontSize: 30.sp,
                                                        fontFamily: 'roboto',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Column(
                                                    children: controller
                                                        .allLists[0]
                                                        .map((e) => ListTile(
                                                              onTap: () {
                                                                Modular
                                                                    .navigator
                                                                    .pushNamed(
                                                                        RouteName
                                                                            .detalhes_assembleia,
                                                                        arguments:
                                                                            e.id);
                                                              },
                                                              leading: Icon(
                                                                FlutterIcons
                                                                    .calendar_alert_mco,
                                                                size: 35,
                                                                color:
                                                                    AppColorScheme
                                                                        .black,
                                                              ),
                                                              subtitle:
                                                                  SubTitleWidget(
                                                                data: e.datreu,
                                                                hora:
                                                                    e.horreu_1,
                                                                local: e.loc,
                                                              ),
                                                              title:
                                                                  TitleWidget(
                                                                nomTip:
                                                                    e.nomtip,
                                                                apelido:
                                                                    e.apelido,
                                                              ),
                                                            ))
                                                        .toList(),
                                                  )
                                                ],
                                              ),
                                            ),
                                      Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'REALIZADAS',
                                                style: TextStyle(
                                                  fontSize: 30.sp,
                                                  fontFamily: 'roboto',
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ),
                                            Divider(),
                                            Column(
                                              children: controller.allLists[1]
                                                  .map((e) => Card(
                                                        child: Column(
                                                          children: [
                                                            ListTile(
                                                              onTap: () {
                                                                Modular
                                                                    .navigator
                                                                    .pushNamed(
                                                                        RouteName
                                                                            .detalhes_assembleia,
                                                                        arguments:
                                                                            e.id);
                                                              },
                                                              leading: Icon(
                                                                FlutterIcons
                                                                    .calendar_check_faw5s,
                                                                size: 35,
                                                                color: AppColorScheme
                                                                    .primaryColor,
                                                              ),
                                                              subtitle:
                                                                  SubTitleWidget(
                                                                data: e.datreu,
                                                                hora:
                                                                    e.horreu_1,
                                                                local: e.loc,
                                                              ),
                                                              title:
                                                                  TitleWidget(
                                                                nomTip:
                                                                    e.nomtip,
                                                                apelido:
                                                                    e.apelido,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                ),
              ],
            );
          default:
            return PageError(
              messageError: "Erro ao buscar as informações",
              onPressed: controller.init,
            );
        }
      }),
    );
  }
}

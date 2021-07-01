import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/assembleia/editais_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'assembleia_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Gestart/app/utils/ui_helper.dart';

class AssembleiaPage extends StatefulWidget {
  final String title;
  final List<CondominioEntity> condominios;

  const AssembleiaPage(
      {Key key, this.title = "Assembleia", @required this.condominios})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            Container(
              height: 110.h,
              child: controller.loading == 0
                  ? Center(child: CircularProgressCustom())
                  : DropdownButtonFieldWidget(
                      label: 'Condominios',
                      hint: 'Selecione',
                      value: controller.conds[0].codcon,
                      list: controller.conds != null ? controller.conds : [],
                      onChanged: (value) {
                        controller.changeDropdown(value);
                      },
                    ),
            ),
            controller.loading != 0
                ? Expanded(
                    child: controller.listaView != null
                        ? Observer(
                            builder: (_) => ListView.builder(
                                  itemCount: controller.listaView.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                        margin: EdgeInsets.all(10),
                                        child: ListTile(
                                            leading: Icon(
                                              Icons.calendar_today,
                                              color:
                                                  AppColorScheme.primaryColor,
                                            ),
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${controller.listaView[index].nomtip}',
                                                  style: TextStyle(
                                                      fontSize: 25.h,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  '- ${controller.listaView[index].apelido}',
                                                  style: TextStyle(
                                                      fontSize: 23.h,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Data: ' +
                                                    UIHelper.formatDate(
                                                        controller
                                                            .listaView[index]
                                                            .datreu) +
                                                    '-' +
                                                    UIHelper.formatTime(
                                                        controller
                                                            .listaView[index]
                                                            .horreu_1)),
                                                Text(
                                                    'Local: ${controller.listaView[index].loc}'),
                                              ],
                                            )));
                                  },
                                ))
                        : Center(child: Text('Nenhuma assembleia disponível')),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'assembleia_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/assembleia/components/title_widget.dart';
import 'package:Gestart/app/modules/assembleia/components/subtitle_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Observer(
        builder: (_) => controller.loading == 0
            ? Center(child: CircularProgressCustom())
            : Column(
                children: [
                  Container(
                    height: 110.h,
                    child: DropdownButtonFieldWidget(
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
                                                onTap: () {
                                                  Modular.navigator.pushNamed(
                                                      RouteName
                                                          .detalhes_assembleia,
                                                      arguments: controller
                                                          .listaView[index].id);
                                                },
                                                leading: Icon(
                                                  Icons.calendar_today,
                                                  color: AppColorScheme
                                                      .primaryColor,
                                                ),
                                                title: TitleWidget(
                                                  nomTip: controller
                                                      .listaView[index].nomtip,
                                                  apelido: controller
                                                      .listaView[index].apelido,
                                                ),
                                                subtitle: SubTitleWidget(
                                                  data: controller
                                                      .listaView[index].datreu,
                                                  hora: controller
                                                      .listaView[index]
                                                      .horreu_1,
                                                  local: controller
                                                      .listaView[index].loc,
                                                ),
                                              ));
                                        },
                                      ))
                              : Center(
                                  child: Text('Nenhuma assembleia disponível')),
                        )
                      : Container(),
                ],
              ),
      ),
    );
  }
}

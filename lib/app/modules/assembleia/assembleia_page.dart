import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
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
      body: Observer(
          builder: (_) => controller.condominios.status == Status.loading &&
                  controller.condominios.data == null
              ? Center(child: CircularProgressCustom())
              : Column(
                  children: [
                    Container(
                      height: 110.h,
                      child: DropdownButtonFieldWidget(
                        label: 'Condominios',
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 5),
                              child: RefreshIndicator(
                                onRefresh: refreshList,
                                child: ListView.builder(
                                    itemCount: controller.listaView.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        child: ListTile(
                                          onTap: () {
                                            Modular.navigator.pushNamed(
                                                RouteName.detalhes_assembleia,
                                                arguments: controller
                                                    .listaView[index].id);
                                          },
                                          leading: Icon(
                                            Icons.calendar_today,
                                            color: AppColorScheme.primaryColor,
                                          ),
                                          subtitle: SubTitleWidget(
                                            data: controller
                                                .listaView[index].datreu,
                                            hora: controller
                                                .listaView[index].horreu_1,
                                            local:
                                                controller.listaView[index].loc,
                                          ),
                                          title: TitleWidget(
                                            nomTip: controller
                                                .listaView[index].nomtip,
                                            apelido: controller
                                                .listaView[index].apelido,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                    ),
                  ],
                )),
    );
  }
}

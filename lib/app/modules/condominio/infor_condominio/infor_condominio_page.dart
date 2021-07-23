import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'infor_condominio_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InforCondominioPage extends StatefulWidget {
  final String title;
  const InforCondominioPage({Key key, this.title = "Seu Condomínio"})
      : super(key: key);

  @override
  _InforCondominioPageState createState() => _InforCondominioPageState();
}

class _InforCondominioPageState
    extends ModularState<InforCondominioPage, InforCondominioController> {
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
        ),
        body: Observer(
          builder: (_) => controller.cond.length == 0 &&
                  controller.listView.length == 0
              ? CircularProgressCustom()
              : Column(
                  children: [
                    DropdownButtonFieldWidget(
                      label: 'Condominios',
                      hint: 'Selecione',
                      list: controller.condominios.data,
                      value: controller.codCon,
                      onChanged: (value) {
                        controller.changeDropdown(value);
                      },
                    ),
                    Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(controller.cond[0].logo),
                        ),
                        title: Text('Nome:'),
                        subtitle: Text(controller.cond[0].apelido.trim()),
                      ),
                    ),
                    controller.listView.length > 0
                        ? Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text('Endereço'),
                                      subtitle:
                                          Text(controller.listView[0].endCon),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      title: Text('CNPJ'),
                                      subtitle:
                                          Text(controller.listView[0].cgcCon),
                                    ),
                                  ),
                                  Divider(),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 30, horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Menbros da Administração'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              'Vigência do mandato: ${UIHelper.formatDateFromDateTime(controller.listView[0].datIni)} - ${UIHelper.formatDateFromDateTime(controller.listView[0].datFin)}'),
                                        ],
                                      )),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: controller.listView.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  controller.listView[index]
                                                      .linkPhoto),
                                            ),
                                            title: Text(controller
                                                .listView[index].nomCar),
                                            subtitle: Text(
                                                '${controller.listView[index].nomAdm}\n${controller.listView[index].codImoAdm == null ? '' : 'Unidade: ' + controller.listView[index].codImoAdm}'),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: Column(
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
                                Text(
                                    'Não existe informações para este condomínio'),
                              ],
                            ),
                          )
                  ],
                ),
        ));
  }
}

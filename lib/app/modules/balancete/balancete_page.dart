import 'dart:async';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field3.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/balancete/balancete_entity.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'balancete_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalancetePage extends StatefulWidget {
  final String title;
  const BalancetePage({Key key, this.title = "Balancete"}) : super(key: key);

  @override
  _BalancetePageState createState() => _BalancetePageState();
}

class _BalancetePageState extends ModularState<BalancetePage, BalanceteController> {
  @override
  void initState() {
    controller.getBalancetes();
    super.initState();
  }

  Future refreshList() {
    return controller.getBalancetes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => !controller.isLoading && controller.condominios != null
            ? Column(
                children: [
                  DropdownButtonFieldWidget(
                    label: 'Condomínios',
                    hint: 'Selecione um condomínio',
                    list: controller.condominios,
                    onChanged: (value) {
                      controller.filterBalancetes(value);
                    },
                  ),
                  Expanded(
                    child: controller.balancetes.length == 0
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
                              Text('Não existem balancetes para este condomínio'),
                            ],
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            child: RefreshIndicator(
                              onRefresh: refreshList,
                              child: ListView.builder(
                                  itemCount: controller.balancetes.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Card(
                                      child: ListTile(
                                        title: Row(
                                          children: [
                                            Text('Competência: '),
                                            Text(
                                              controller.balancetes[index].mesAno,
                                              style: TextStyle(color: AppColorScheme.primaryColor),
                                            ),
                                          ],
                                        ),
                                        subtitle:
                                            Text('Período: ${UIHelper.formatDate(controller.balancetes[index].dt1)} - ${UIHelper.formatDate(controller.balancetes[index].dt2)}'),
                                        onTap: () => Modular.navigator.pushNamed(
                                          RouteName.view_documento,
                                          arguments: [
                                            controller.balancetes[index].linkBalanceteAna,
                                            controller.balancetes[index].mesAno + ' - ' + controller.balancetes[index].apelido
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                  ),
                ],
              )
            : CircularProgressCustom(),
      ),
    );
  }
}

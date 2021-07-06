import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field3.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'boleto_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoletoPage extends StatefulWidget {
  final String title;
  const BoletoPage({Key key, this.title = "Boleto"}) : super(key: key);

  @override
  _BoletoPageState createState() => _BoletoPageState();
}

class _BoletoPageState extends ModularState<BoletoPage, BoletoController> {
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
        title: Text('Boleto Digital'),
      ),
      body: Observer(
        builder: (_) => controller.condominios.status == Status.loading
            ? CircularProgressCustom()
            : Column(
                children: <Widget>[
                  Container(
                    height: 110.h,
                    child: controller.condominios.data == null
                        ? CircularProgressCustom()
                        : DropdownButtonField3Widget(
                            label: 'Condominios',
                            hint: 'Selecione',
                            value: controller.condominios.data[0].codcon,
                            list: controller.condominios.data != null
                                ? controller.condominios.data
                                : [],
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                  )
                ],
              ),
      ),
    );
  }
}

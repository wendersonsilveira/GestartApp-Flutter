import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'assembleia_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    print(widget.condominios);
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
      body: Column(
        children: <Widget>[
          Container(
            height: 100.h,
            color: AppColorScheme.primaryColor,
            child: DropdownButtonFieldWidget(
              hint: 'Condomínios',
              list: [],
            ),
          )
        ],
      ),
    );
  }
}

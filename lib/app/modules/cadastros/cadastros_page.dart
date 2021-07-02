import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/cadastros/components/item_cadastro_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastros_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CadastrosPage extends StatefulWidget {
  final String title;
  const CadastrosPage({Key key, this.title = "Cadastros"}) : super(key: key);

  @override
  _CadastrosPageState createState() => _CadastrosPageState();
}

class _CadastrosPageState
    extends ModularState<CadastrosPage, CadastrosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text('Cadastro'),
        ),
        body: Column(
          children: [
            ItemCadastroWidget(
              descricao: 'Dependente',
              icone: Icons.person,
            ),
            Divider(
              color: Colors.black,
              indent: 50,
            ),
            ItemCadastroWidget(
              descricao: 'Pets',
              icone: Icons.pets,
              routeName: RouteName.pets,
            ),
            Divider(
              color: Colors.black,
              indent: 50,
            ),
            ItemCadastroWidget(
              descricao: 'Veiculos',
              icone: FlutterIcons.car_alt_faw5s,
            ),
          ],
        ));
  }
}

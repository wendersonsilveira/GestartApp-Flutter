import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ativar_condominio_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtivarCondominioPage extends StatefulWidget {
  final String title;
  const AtivarCondominioPage({Key key, this.title = "Ativar Condomínio"})
      : super(key: key);

  @override
  _AtivarCondominioPageState createState() => _AtivarCondominioPageState();
}

class _AtivarCondominioPageState
    extends ModularState<AtivarCondominioPage, AtivarCondominioController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 20),
        child: Column(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.ac_unit,
                  size: 50.h,
                  color: AppColorScheme.primaryColor,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
                title: Text('Pelo condomínio online'),
                subtitle:
                    Text('Coloque o Usuário e Senha que vem no seu boleto'),
                onTap: () {
                  Modular.to.pushNamed(RouteName.condominio_online_ativar);
                }),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.ac_unit,
                size: 50.h,
                color: AppColorScheme.primaryColor,
              ),
              trailing: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text('Por código de ativação'),
              subtitle: Text('Você receberá um Email com o código de ativação'),
              onTap: () {
                Modular.to.pushNamed(RouteName.ativar_codigo_email);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControleRecebimentosPage extends StatefulWidget {
  const ControleRecebimentosPage({Key key}) : super(key: key);

  @override
  _ControleRecebimentosPageState createState() => _ControleRecebimentosPageState();
}

class _ControleRecebimentosPageState extends State<ControleRecebimentosPage> {
  navigateTo(String routeName) {
    Modular.navigator.pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            'CONTROLE DE RECEBIMENTOS',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text('Recebimentos'),
                    leading: Icon(
                      FlutterIcons.square_faw,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () => navigateTo(RouteName.recebimentos),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Inadiplência'),
                    leading: Icon(
                      FlutterIcons.square_faw,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Acordos'),
                    leading: Icon(
                      FlutterIcons.square_faw,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinanceiroPage extends StatefulWidget {
  const FinanceiroPage({Key key}) : super(key: key);

  @override
  _FinanceiroPageState createState() => _FinanceiroPageState();
}

class _FinanceiroPageState extends State<FinanceiroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            'FINANCEIRO',
            style: TextStyle(fontSize: 18),
          ),
          Card(
            child: ListTile(
                leading: Icon(FlutterIcons.square_faw,
                    color: AppColorScheme.primaryColor),
                title: Text('Contas Fixas'),
                trailing: Icon(Icons.arrow_right),
                onTap: () =>
                    Modular.navigator.pushNamed(RouteName.contas_fixas)),
          ),
          Card(
            child: ListTile(
                leading: Icon(FlutterIcons.square_faw,
                    color: AppColorScheme.primaryColor),
                title: Text('Movimento Financeiro'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => Modular.navigator
                    .pushNamed(RouteName.movimento_financeiro)),
          ),
          Card(
            child: ListTile(
                leading: Icon(FlutterIcons.square_faw,
                    color: AppColorScheme.primaryColor),
                title: Text('Boletos'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => Modular.navigator
                    .pushNamed(RouteName.listaBoletos)),
          ),
        ],
      ),
    );
  }
}

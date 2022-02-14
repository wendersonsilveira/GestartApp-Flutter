import 'package:flutter/material.dart';
import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_icons/line_icons.dart';

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
                leading:
                    Icon(LineIcons.stop, color: AppColorScheme.primaryColor),
                title: Text('Contas Fixas'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => Modular.to.pushNamed(RouteName.contas_fixas)),
          ),
          Card(
            child: ListTile(
                leading:
                    Icon(LineIcons.stop, color: AppColorScheme.primaryColor),
                title: Text('Movimento Financeiro'),
                trailing: Icon(Icons.arrow_right),
                onTap: () =>
                    Modular.to.pushNamed(RouteName.movimento_financeiro)),
          ),
        ],
      ),
    );
  }
}

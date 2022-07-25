import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/relatorio_inadimplencia_page.dart';
import 'package:Gestart/app/modules/sindico/relatorios/reservas/relatorio_reservas_page.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class RelatoriosPage extends StatefulWidget {
  const RelatoriosPage({Key key}) : super(key: key);

  @override
  _RelatoriosPageState createState() => _RelatoriosPageState();
}

class _RelatoriosPageState extends State<RelatoriosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            'Relatórios',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text('Reservas de espaço'),
                    leading: Icon(
                      Icons.ac_unit,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RelatorioReservasPage(),
                      ));
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Relatório de inadimplência'),
                    leading: Icon(
                      Icons.ac_unit,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RelatorioInadimplenciaPage(),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

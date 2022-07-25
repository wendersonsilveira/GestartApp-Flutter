import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/sindico/controle_recebimentos/acordo/acordos_page.dart';
import 'package:Gestart/app/modules/sindico/controle_recebimentos/components/filtro_inadim_wigedt.dart';
import 'package:Gestart/app/modules/sindico/controle_recebimentos/components/filtro_widget.dart';
import 'package:Gestart/app/modules/sindico/controle_recebimentos/inadimplencia/inadimplencia_page.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControleRecebimentosPage extends StatefulWidget {
  const ControleRecebimentosPage({Key key}) : super(key: key);

  @override
  _ControleRecebimentosPageState createState() =>
      _ControleRecebimentosPageState();
}

class _ControleRecebimentosPageState extends State<ControleRecebimentosPage> {
  navigateTo(String routeName) {
    Modular.navigator.pushNamed(routeName).then((value) {
      FiltroWdget.filtro['CODORD'] = 0;
      FiltroWdget.filtro['TIPTAX'] = '0';
      FiltroWdget.filtro['DATPAG_1'] = UIHelper.formatDateFromDateTimeReverse(
          DateTime.utc(DateTime.now().year, DateTime.now().month, 01));
      FiltroWdget.filtro['DATPAG_2'] =
          UIHelper.formatDateFromDateTimeReverse(DateTime.now());
    });
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
                      Icons.ac_unit,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () => navigateTo(RouteName.recebimentos),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Inadimplência'),
                    leading: Icon(
                      Icons.ac_unit,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (context) => InadimplenciaPage(),
                      ))
                          .then((value) {
                        FiltroInadimWdget.filtro['CODORD'] = 0;
                        FiltroInadimWdget.filtro['TIPTAX'] = '0';
                      });
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Acordos'),
                    leading: Icon(
                      Icons.ac_unit,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AcordosPage(),
                      ));
                    },
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

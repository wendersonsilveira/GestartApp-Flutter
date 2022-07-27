import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({Key key}) : super(key: key);

  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            'RESERVA DE ESPAÇO',
            style: TextStyle(fontSize: 18),
          ),
          Card(
            child: ListTile(
                leading:
                    Icon(Icons.ac_unit, color: AppColorScheme.primaryColor),
                title: Text('Cadastro de Espaços'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => Modular.to.pushNamed(RouteName.listar_espacos)),
          ),
          Card(
            child: ListTile(
                leading:
                    Icon(Icons.ac_unit, color: AppColorScheme.primaryColor),
                title: Text('Gerenciamento de Reservas'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => Modular.to.pushNamed(RouteName.gerenciar_reserva)),
          ),
          Card(
            child: ListTile(
                leading:
                    Icon(Icons.ac_unit, color: AppColorScheme.primaryColor),
                title: Text('Relatório de reservas'),
                trailing: Icon(Icons.arrow_right),
                onTap: () => Modular.to.pushNamed(RouteName.relatorioReservas)),
          ),
        ],
      ),
    );
  }
}

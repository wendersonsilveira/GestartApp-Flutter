import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ComunicacaoPage extends StatefulWidget {
  const ComunicacaoPage({Key key}) : super(key: key);

  @override
  _ComunicacaoPageState createState() => _ComunicacaoPageState();
}

class _ComunicacaoPageState extends State<ComunicacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            'COMUNICAÇÃO',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text('Avisos'),
                    leading: Icon(
                      FlutterIcons.square_faw,
                      color: AppColorScheme.primaryColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () => null,
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

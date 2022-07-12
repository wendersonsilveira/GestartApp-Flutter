import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemCadastroWidget extends StatelessWidget {
  const ItemCadastroWidget(
      {Key key, this.descricao, this.icone, this.routeName})
      : super(key: key);

  final String descricao;
  final IconData icone;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.navigator.pushNamed(routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Card(
          child: ListTile(
            title: Text(descricao),
            leading: Icon(
              icone,
              color: AppColorScheme.primaryColor,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}

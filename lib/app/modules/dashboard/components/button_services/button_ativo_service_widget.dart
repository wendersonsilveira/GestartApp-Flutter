import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonServiceWidget extends StatelessWidget {
  const ButtonServiceWidget({Key key, this.icon, this.descricao, this.route}) : super(key: key);

  final IconData icon;
  final String descricao;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: OutlinedButton(
            onPressed: () => Modular.navigator.pushNamed(route),
            child: Icon(
              icon,
              color: AppColorScheme.primaryColor,
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
            ),
          ),
        ),
        Text(
          descricao,
          style: TextStyle(color: AppColorScheme.neutralMedium4),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

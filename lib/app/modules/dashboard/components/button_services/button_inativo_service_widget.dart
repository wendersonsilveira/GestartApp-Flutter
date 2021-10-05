import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class ButtonServicesInativoWidget extends StatelessWidget {
  const ButtonServicesInativoWidget({Key key, this.icon, this.descricao})
      : super(key: key);

  final IconData icon;
  final String descricao;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: OutlinedButton(
            onPressed: () {
              print('teste');
            },
            child: Icon(
              icon,
              color: AppColorScheme.primaryColor,
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.grey[400],
              shape: CircleBorder(),
            ),
          ),
        ),
        Text(
          descricao,
          style: TextStyle(color: AppColorScheme.primaryColor),
        )
      ],
    );
  }
}

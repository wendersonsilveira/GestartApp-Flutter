import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class ButtonServiceWidget extends StatelessWidget {
  const ButtonServiceWidget({Key key, this.icon, this.descricao})
      : super(key: key);

  final IconData icon;
  final String descricao;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('teste');
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            child: OutlinedButton(
              onPressed: () {},
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
            style: TextStyle(color: AppColorScheme.primaryColor),
          )
        ],
      ),
    );
  }
}

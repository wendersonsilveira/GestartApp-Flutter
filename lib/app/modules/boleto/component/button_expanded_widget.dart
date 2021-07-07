import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class ButtonExpandedWidget extends StatelessWidget {
  const ButtonExpandedWidget({Key key, this.descricao}) : super(key: key);
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: RaisedButton(
              color: AppColorScheme.backgroundColor,
              onPressed: () => print('teste'),
              child: Text(
                descricao,
                style: TextStyle(color: AppColorScheme.primaryColor),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: AppColorScheme.primaryColor)),
            ),
          ),
        ),
      ],
    );
  }
}

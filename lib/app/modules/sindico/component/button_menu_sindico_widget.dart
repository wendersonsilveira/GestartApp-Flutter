import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class ButtonMenuWidget extends StatefulWidget {
  const ButtonMenuWidget({Key key, this.icone, this.descricao, this.onPress})
      : super(key: key);
  final IconData icone;
  final String descricao;
  final Function onPress;

  @override
  ButtonMenuWidgetState createState() => ButtonMenuWidgetState();
}

class ButtonMenuWidgetState extends State<ButtonMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: OutlinedButton(
            onPressed: widget.onPress, //Modular.navigator.pushNamed(route),
            child: Icon(
              widget.icone,
              color: AppColorScheme.primaryColor,
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
            ),
          ),
        ),
        Text(
          widget.descricao,
          style: TextStyle(color: AppColorScheme.primaryColor),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

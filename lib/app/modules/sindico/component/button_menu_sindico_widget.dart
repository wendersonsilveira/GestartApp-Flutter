import 'package:Gestart/app/modules/dashboard/components/button_services/button_ativo_service_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonMenuWidget extends StatefulWidget {
  const ButtonMenuWidget({Key key, this.icone, this.descricao})
      : super(key: key);
  final IconData icone;
  final String descricao;

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
            // onPressed: () => Modular.navigator.pushNamed(route),
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

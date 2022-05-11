import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class ButtonServicesIndisponivelWidget extends StatelessWidget {
  const ButtonServicesIndisponivelWidget({Key key, this.icon, this.descricao})
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
              CustomAlertDialog.info(
                  context,
                  "Serviço não habilitado",
                  "Esse serviço não está habilitado para este condomínio, entre em contato com o Síndico.",
                  (_) => {Navigator.pop(context)});
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

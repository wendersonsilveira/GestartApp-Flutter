import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class LeadingStatusCobrancaWidget extends StatefulWidget {
  const LeadingStatusCobrancaWidget({Key key, this.tipoCobranca})
      : super(key: key);
  final String tipoCobranca;

  @override
  LeadingStatusCobrancaWidgetState createState() =>
      LeadingStatusCobrancaWidgetState();
}

class LeadingStatusCobrancaWidgetState
    extends State<LeadingStatusCobrancaWidget> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.tipoCobranca == "ADMINISTRATIVO"
                ? Icon(Icons.circle,
                    color: AppColorScheme.primaryColor, size: 32)
                : Icon(Icons.circle,
                    color: AppColorScheme.feedbackDangerLight, size: 32),
            Text(widget.tipoCobranca,
                style: TextStyle(color: AppColorScheme.black, fontSize: 8))
          ],
        ),
      );
}

import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class IconStatusHelperWidget extends StatefulWidget {
  const IconStatusHelperWidget({Key key, this.status}) : super(key: key);
  final int status;

  @override
  IconStatusHelperWidgetState createState() => IconStatusHelperWidgetState();
}

class IconStatusHelperWidgetState extends State<IconStatusHelperWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case 0:
        return SizedBox(
          width: 70,
          child: Column(
            children: [
              Icon(FlutterIcons.error_outline_mdi,
                  color: AppColorScheme.tagYellow2, size: 32),
              Text('Aguardando',
                  style: TextStyle(color: AppColorScheme.tagYellow2, fontSize: 12)),
            ],
          ),
        );
        break;
      case 1:
        return SizedBox(
          width: 70,
          child: Column(
            children: [
              Icon(FlutterIcons.check_circle_outline_mco,
                  color: AppColorScheme.primaryColor, size: 32),
              Text('Aprovada',
                  style: TextStyle(color: AppColorScheme.primaryColor, fontSize: 12)),
            ],
          ),
        );
        break;
      case 2:
        return SizedBox(
          width: 70,
          child: Column(
            children: [
              Icon(FlutterIcons.highlight_off_mdi,
                  color: AppColorScheme.tagRed2, size: 32),
              Text('Rejeitada', style: TextStyle(color: AppColorScheme.tagRed2, fontSize: 12))
            ],
          ),
        );
        break;
      case 3:
        return SizedBox(
          width: 70,
          child: Column(
            children: [
              Icon(FlutterIcons.highlight_off_mdi,
                  color: AppColorScheme.tagRed2, size: 32),
              Text('Cancelada', style: TextStyle(color: AppColorScheme.tagRed2, fontSize: 12)),
            ],
          ),
        );
        break;
      default:
    }
  }
}

class StatusHelperWidget extends StatefulWidget {
  const StatusHelperWidget({Key key, this.status}) : super(key: key);
  final int status;

  @override
  StatusHelperWidgetState createState() => StatusHelperWidgetState();
}

class StatusHelperWidgetState extends State<StatusHelperWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case 0:
        return Text('AGUARDANDO APROVAÇÃO',
            style: TextStyle(color: AppColorScheme.tagYellow2));
        break;
      case 1:
        return Text('APROVADA',
            style: TextStyle(color: AppColorScheme.primaryColor));
        break;
      case 2:
        return Text('REJEITADA',
            style: TextStyle(color: AppColorScheme.tagRed2));
        break;
      case 3:
        return Text('CANCELADA',
            style: TextStyle(color: AppColorScheme.tagRed2));
        break;
      default:
    }
  }
}

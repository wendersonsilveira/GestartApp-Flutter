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
        return Icon(FlutterIcons.error_outline_mdi, color: AppColorScheme.tagYellow2, size: 32);
        break;
      case 1:
        return Icon(FlutterIcons.check_circle_outline_mco, color: AppColorScheme.primaryColor, size: 32);
        break;
      case 2:
        return Icon(FlutterIcons.highlight_off_mdi, color: AppColorScheme.tagRed2, size: 32);
        break;
      case 3:
        return Icon(FlutterIcons.highlight_off_mdi, color: AppColorScheme.tagRed2, size: 32);
        break;
      default:
    }
  }
}

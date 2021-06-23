import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;
  const InfoDialog({Key key, this.title, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(FlutterIcons.info_circle_faw, color: AppColorScheme.tagOrange2),
          SizedBox(
            width: 20.w,
          ),
          Flexible(
            child: Text(
              title,
              style: AppTextTheme.titleAlertInfo,
            ),
          )
        ],
      ),
      content: Text(message),
      actions: [
        FlatButtonWidget(
            text: "Ok",
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}

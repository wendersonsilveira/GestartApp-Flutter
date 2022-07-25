import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onClickButton;
  final String textButton;
  const InfoDialog(
      {Key key,
      this.title,
      this.message,
      this.textButton = 'OK',
      this.onClickButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.ac_unit, color: AppColorScheme.tagOrange2),
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
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onClickButton != null ? onClickButton() : null;
          },
          child: Text(textButton),
        )
      ],
    );
  }
}

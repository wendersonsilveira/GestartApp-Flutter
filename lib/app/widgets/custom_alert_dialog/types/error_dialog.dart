import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorDialog extends StatelessWidget {
  final String error;
  const ErrorDialog({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(FlutterIcons.error_outline_mdi,
              color: AppColorScheme.feedbackDangerDark),
          SizedBox(
            width: 20.w,
          ),
          Flexible(
            child: Text(
              "Ocorreu um erro",
              style: AppTextTheme.titleAlertError,
            ),
          )
        ],
      ),
      content: Text(error),
      actions: [
        FlatButtonWidget(
            cor: Colors.red,
            text: "Ok",
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}

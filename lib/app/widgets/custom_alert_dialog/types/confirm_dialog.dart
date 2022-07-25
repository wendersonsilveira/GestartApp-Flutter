import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDialog extends StatelessWidget {
  final String message;
  final String title;
  final Function onClickButton;
  const ConfirmDialog({Key key, this.message, this.title, this.onClickButton})
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
          Icon(Icons.ac_unit, color: AppColorScheme.feedbackSuccessDark2),
          SizedBox(
            width: 20.w,
          ),
          Flexible(
            child: Text(
              title,
              style: AppTextTheme.titleAlertSuccess,
            ),
          ),
        ],
      ),
      content: Text(message),
      actions: [
        FlatButtonWidget(
            text: "Ok",
            onPressed: () {
              Navigator.of(context).pop();
              onClickButton();
            }),
      ],
    );
  }
}

import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/buttons/flat_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionDialog extends StatelessWidget {
  final String message;
  final String title;
  final Function onActionPositiveButton;
  final Function onActionNegativeButton;
  final String textButtonNegative;
  final String textButtonPositive;
  const QuestionDialog(
      {Key key,
      @required this.title,
      @required this.message,
      @required this.onActionPositiveButton,
      @required this.onActionNegativeButton,
      this.textButtonNegative,
      this.textButtonPositive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        style: AppTextTheme.titleAlertQestion,
      ),
      content: Text(message),
      actions: [
        FlatButtonWidget(
            text: textButtonNegative != null ? textButtonNegative : "Não",
            onPressed: () {
              Navigator.of(context).pop();
              onActionNegativeButton();
            }),
        FlatButtonWidget(
            text: textButtonPositive != null ? textButtonPositive : "Sim",
            onPressed: () {
              Navigator.of(context).pop();
              onActionPositiveButton();
            }),
      ],
    );
  }
}

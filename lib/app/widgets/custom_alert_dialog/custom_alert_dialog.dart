import 'package:Gestart/app/widgets/custom_alert_dialog/types/confirm_dialog.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/types/error_dialog.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/types/info_dialog.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/types/question_dialog.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  static Future<void> error(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        error: error,
      ),
    );
  }

  static Future<void> success(BuildContext context, String title,
      String message, Function onActionButton) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
          title: title, message: message, onClickButton: onActionButton),
    );
  }

  static Future<void> question(BuildContext context,
      {String title,
      String message,
      Color colorPositive,
      Color colorNegative,
      Function onActionPositiveButton,
      Function onActionNegativeButton,
      String textButtonPositive,
      String textButtonNegative}) {
    return showDialog(
      context: context,
      builder: (context) => QuestionDialog(
        title: title,
        message: message,
        onActionPositiveButton: onActionPositiveButton,
        onActionNegativeButton: onActionNegativeButton,
        textButtonPositive: textButtonPositive,
        textButtonNegative: textButtonNegative,
        colorPositive: colorPositive,
        colorNegative: colorNegative,
      ),
    );
  }

  static Future<void> info(BuildContext context, String title, String message,
      Function onActionButton) {
    return showDialog(
      context: context,
      builder: (context) => InfoDialog(title: title, message: message),
    );
  }
}

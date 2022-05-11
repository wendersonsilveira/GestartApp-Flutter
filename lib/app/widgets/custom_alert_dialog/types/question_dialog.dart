import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:flutter/material.dart';

class QuestionDialog extends StatelessWidget {
  final String message;
  final String title;
  final Function onActionPositiveButton;
  final Function onActionNegativeButton;
  final String textButtonNegative;
  final String textButtonPositive;
  final Color colorPositive;
  final Color colorNegative;

  const QuestionDialog(
      {Key key,
      @required this.title,
      @required this.message,
      @required this.onActionPositiveButton,
      @required this.onActionNegativeButton,
      this.textButtonNegative,
      this.textButtonPositive,
      this.colorPositive,
      this.colorNegative})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title != null ? title : "",
        style: AppTextTheme.titleAlertQestion,
      ),
      content: message != null ? Text(message) : Text('aaaaa'),
      actions: [
        TextButton(
            child: Text(textButtonNegative != null ? textButtonNegative : "Não",
                style: TextStyle(color: colorNegative ?? Colors.black)),
            // cor: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
              onActionNegativeButton();
            }),
        TextButton(
            child: Text(
              textButtonPositive != null ? textButtonPositive : "Sim",
              style: TextStyle(color: colorPositive ?? Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
              onActionPositiveButton();
            }),
      ],
    );
  }
}

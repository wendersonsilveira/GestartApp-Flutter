import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  FlatButtonWidget(
      {@required this.text, @required this.onPressed, this.loading: false});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      onPressed: loading ? null : onPressed,
      child: loading
          ? CircularProgressCustom()
          : Text(
              text,
              style: AppTextTheme.white,
            ),
    );
  }
}

import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlatButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final Color cor;
  FlatButtonWidget(
      {@required this.text,
      @required this.onPressed,
      this.loading: false,
      this.cor});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 60.h,
      color: cor,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      onPressed: loading ? null : onPressed,
      child: loading
          ? CircularProgressCustom()
          : Text(
              text,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
    );
  }
}

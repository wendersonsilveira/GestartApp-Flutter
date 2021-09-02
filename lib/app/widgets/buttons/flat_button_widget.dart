import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlatButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final Color cor;
  final ShapeBorder shap;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  FlatButtonWidget({
    @required this.text,
    @required this.onPressed,
    this.loading: false,
    this.cor,
    this.shap,
    this.fontSize = 12,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 60.h,
      color: cor,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      onPressed: loading ? null : onPressed,
      child: loading
          ? CircularProgressCustom()
          : Container(
              padding: padding,
              width: (MediaQuery.of(context).size.width),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize,
                    color: shap != null
                        ? AppColorScheme.primaryColor
                        : Colors.white),
              ),
            ),
      shape: shap != null
          ? shap
          : RoundedRectangleBorder(side: BorderSide(color: cor)),
    );
  }
}

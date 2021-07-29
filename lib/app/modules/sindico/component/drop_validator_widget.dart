import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownValidator extends StatelessWidget {
  const DropDownValidator(
      {Key key, this.lista, this.validator, this.value, this.onChange})
      : super(key: key);

  final List<dynamic> lista;
  final int value;
  final Function validator;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: lista
          .map((element) => DropdownMenuItem(
                value: element != null ? element.id : null,
                child: element != null
                    ? Text(element.descricao)
                    : Text('Selecione'),
              ))
          .toList(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChange,
      value: value,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        errorMaxLines: 2,
        errorStyle: TextStyle(color: AppColorScheme.feedbackDangerDark),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColorScheme.primaryColor, width: 3.h)),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColorScheme.primaryColor, width: 3.h)),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColorScheme.feedbackDangerDark, width: 3.0.h)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColorScheme.feedbackDangerDark, width: 3.0.h)),
      ),
    );
  }
}

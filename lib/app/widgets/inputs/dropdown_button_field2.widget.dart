import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownButtonFieldWidget2 extends StatelessWidget {
  final List<String> list;
  final String label;
  final String hint;
  final Function onChanged;
  final FocusNode focusNode;
  final double contentPadding;
  final String value;
  // final Function validator;

  const DropdownButtonFieldWidget2({
    Key key,
    this.list,
    this.label,
    @required this.hint,
    this.onChanged,
    this.focusNode,
    this.contentPadding = 0,
    this.value,
    // this.validator,
  })  : assert(hint != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueContentPadding = contentPadding;
    return DropdownButtonFormField(
      items: list
          .map((element) => DropdownMenuItem(
                value: element.length > 0 ? element : null,
                child: element.length > 0 ? Text(element) : Text('Selecione'),
              ))
          .toList(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      onChanged: onChanged,
      value: value,
      validator: (value) => value != null ? null : "Campo obrigatório",
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(valueContentPadding),
        labelText: label,
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

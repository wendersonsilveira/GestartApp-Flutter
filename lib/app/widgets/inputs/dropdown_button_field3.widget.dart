import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownButtonField3Widget extends StatelessWidget {
  final List<dynamic> list;
  final String label;
  final String hint;
  final Function onChanged;
  final FocusNode focusNode;
  final bool contentPadding;
  final int value;
  const DropdownButtonField3Widget(
      {Key key,
      this.list,
      this.label,
      @required this.hint,
      this.onChanged,
      this.focusNode,
      this.contentPadding = true,
      this.value})
      : assert(hint != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueContentPadding = contentPadding ? 10.0 : 0.0;
    return DropdownButtonFormField(
      items: list
          .map((element) => DropdownMenuItem(
                value: element.codord,
                child: Text("${element.apelido} - ${element.codimo}"),
              ))
          .toList(),
      focusNode: focusNode,
      onChanged: onChanged,
      value: value,
      validator: (value) => value != null ? null : "Campo obrigatório",
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(valueContentPadding),
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(color: AppColorScheme.white),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColorScheme.primaryColor, width: 3.0.h)),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColorScheme.primaryColor, width: 3.0.h)),
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

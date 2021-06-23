import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderlineTextFieldWidget extends StatelessWidget {
  final String hint;
  final String labelText;
  final bool obscure;
  final Function onChanged;
  final Function onComplete;
  final Function onSubmitted;
  final Function onSaved;
  final int maxLines;
  final bool autofocus;
  final bool enabled;
  final int maxLength;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function validator;
  final TextInputAction inputAction;
  final FocusNode focusNode;
  final String textError;
  final IconData leftIcon;
  final IconData rigthIcon;
  final Function onPressLeftIcon;
  final TextAlign textAlign;
  final List<TextInputFormatter> inputFormatters;
  final bool contentPadding;
  final bool readOnly;
  final String initialValue;

  UnderlineTextFieldWidget(
      {Key key,
      this.hint,
      this.labelText,
      this.initialValue,
      this.leftIcon,
      this.obscure: false,
      this.enabled: true,
      this.onChanged,
      this.onComplete,
      this.onSubmitted,
      this.onSaved,
      this.controller,
      this.maxLines: 1,
      this.autofocus: false,
      this.readOnly: false,
      this.contentPadding: false,
      this.maxLength,
      this.validator,
      this.keyboardType,
      this.inputAction,
      this.focusNode,
      this.textError,
      this.rigthIcon,
      this.onPressLeftIcon,
      this.inputFormatters,
      this.textAlign});
  @override
  Widget build(BuildContext context) {
    final valueContentPadding = contentPadding ? 10.0 : 0.0;
    return TextFormField(
      validator: validator,
      autovalidateMode: validator != null
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onSaved: onSaved,
      enabled: enabled,
      onFieldSubmitted: onSubmitted,
      obscureText: obscure,
      readOnly: readOnly,
      cursorColor: AppColorScheme.primaryColor,
      onChanged: onChanged,
      onEditingComplete: onComplete,
      controller: controller,
      maxLines: maxLines,
      autofocus: autofocus,
      keyboardType: keyboardType,
      maxLength: maxLength,
      textInputAction: inputAction,
      textAlign: textAlign ?? TextAlign.start,
      focusNode: focusNode,
      inputFormatters: inputFormatters != null ? inputFormatters : [],
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.all(valueContentPadding),
        suffixIcon: rigthIcon != null
            ? IconButton(
                onPressed: onPressLeftIcon,
                icon: Icon(rigthIcon),
                color: AppColorScheme.primaryColor,
              )
            : null,
        errorText: textError,
        errorMaxLines: 2,
        errorStyle: TextStyle(color: AppColorScheme.feedbackDangerDark),
        prefixIcon: leftIcon != null
            ? Icon(
                leftIcon,
                color: AppColorScheme.primaryColor,
              )
            : null,
        labelText: labelText,
        hintText: hint,
        fillColor: textError == null
            ? AppColorScheme.white
            : AppColorScheme.feedbackDangerLight,
        filled: true,
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

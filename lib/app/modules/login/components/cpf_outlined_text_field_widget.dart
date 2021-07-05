import 'package:Gestart/app/widgets/inputs/outlined_text_field_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class OutlinedTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSaved;
  final String placeholder;
  final String errorText;
  final String Function(String value) validator;
  final FocusNode focusNode;
  final void Function(String) onSubmitted;
  final void Function(String) onChange;
  final TextInputAction textInputAction;
  final bool loading;
  final IconData rightIcon;

  const OutlinedTextFieldWidget(
      {Key key,
      this.controller,
      this.onSaved,
      this.placeholder,
      this.errorText,
      this.validator,
      this.focusNode,
      this.onSubmitted,
      this.onChange,
      this.textInputAction,
      this.loading,
      this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedTextFieldFormWidget(
      keyboardType: TextInputType.number,
      validator: validator,
      textError: errorText,
      controller: controller,
      hint: placeholder,
      focusNode: focusNode,
      onChanged: onChange,
      onSubmitted: onSubmitted,
      inputAction: textInputAction,
      leftIcon: rightIcon,
    );
  }
}
import 'package:Gestart/app/widgets/inputs/outlined_text_field_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PasswordOutlinedTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onSaved;
  final String placeholder;
  final String errorText;
  final String Function(String value) validator;
  final FocusNode focusNode;
  final void Function(String) onSubmitted;
  final TextInputAction textInputAction;
  final bool loading;
  final bool isWhite;

  const PasswordOutlinedTextFieldWidget(
      {Key key,
      this.controller,
      this.onSaved,
      this.placeholder,
      this.validator,
      this.errorText,
      this.focusNode,
      this.onSubmitted,
      this.textInputAction,
      this.loading,
      this.isWhite: false})
      : super(key: key);

  @override
  _PasswordOutlinedTextFieldWidgetState createState() =>
      _PasswordOutlinedTextFieldWidgetState();
}

class _PasswordOutlinedTextFieldWidgetState
    extends State<PasswordOutlinedTextFieldWidget> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return OutlinedTextFieldFormWidget(
      prefixIcon: LineIcons.lock,
      textError: widget.errorText,
      validator: widget.validator,
      controller: widget.controller,
      obscure: obscure,
      hint: widget.placeholder,
      leftIcon: obscure ? LineIcons.eye : LineIcons.lowVision,
      onPressLeftIcon: () {
        setState(() {
          obscure = !obscure;
        });
      },
      focusNode: widget.focusNode,
      onSubmitted: widget.onSubmitted,
      inputAction: widget.textInputAction,
      isWhite: widget.isWhite,
    );
  }
}

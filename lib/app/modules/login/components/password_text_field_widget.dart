import 'package:Gestart/app/widgets/inputs/outlined_text_field_light_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onSaved;
  final String placeholder;
  final String errorText;
  final String Function(String value) validator;
  final FocusNode focusNode;
  final void Function(String) onSubmitted;
  final TextInputAction textInputAction;
  final bool loading;

  const PasswordTextFieldWidget(
      {Key key,
      this.controller,
      this.onSaved,
      this.placeholder,
      this.validator,
      this.errorText,
      this.focusNode,
      this.onSubmitted,
      this.textInputAction,
      this.loading})
      : super(key: key);

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return OutlinedTextFieldLightFormWidget(
      prefixIcon: FlutterIcons.lock_outline_mco,
      textError: widget.errorText,
      validator: widget.validator,
      controller: widget.controller,
      obscure: obscure,
      hint: widget.placeholder,
      leftIcon: obscure
          ? FlutterIcons.eye_outline_mco
          : FlutterIcons.eye_off_outline_mco,
      onPressLeftIcon: () {
        setState(() {
          obscure = !obscure;
        });
      },
      focusNode: widget.focusNode,
      onSubmitted: widget.onSubmitted,
      inputAction: widget.textInputAction,
    );
  }
}

import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownFilterWidget extends StatefulWidget {
  final dynamic value;
  final List<Map<String, dynamic>> items;
  final Function onChanged;
  final String label;
  final String hint;

  const DropdownFilterWidget({Key key, this.value, this.items, this.onChanged, this.label, this.hint}) : super(key: key);

  @override
  _DropdownFilterWidgetState createState() => _DropdownFilterWidgetState();
}

class _DropdownFilterWidgetState extends State<DropdownFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.value,
      items: widget.items
          .map(
            (e) => DropdownMenuItem(
              child: Text(e.entries.first.key),
              value: e[e.entries.first.key],
            ),
          )
          .toList(),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        labelText: widget.label,
        hintText: widget.hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(color: AppColorScheme.white),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.primaryColor, width: 3.0.h)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.primaryColor, width: 3.0.h)),
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.feedbackDangerDark, width: 3.0.h)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.feedbackDangerDark, width: 3.0.h)),
      ),
    );
  }
}

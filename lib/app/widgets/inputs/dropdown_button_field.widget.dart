import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropdownButtonFieldWidget extends StatefulWidget {
  final List<dynamic> list;
  final String label;
  final String hint;
  final Function onChanged;
  final FocusNode focusNode;
  final bool contentPadding;
  final int value;
  const DropdownButtonFieldWidget(
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
  _DropdownButtonFieldWidgetState createState() =>
      _DropdownButtonFieldWidgetState();
}

class _DropdownButtonFieldWidgetState extends State<DropdownButtonFieldWidget> {
  int oldValue;

  @override
  void initState() {
    if (widget.value == null) {
      SharedPreferences.getInstance().then((storage) {
        var r = storage.getInt('codCon');
        setState(() {
          if (r != null) {
            oldValue = r;
          } else {
            oldValue = widget.list[0].codcon;
          }
        });
      });
    } else {
      oldValue = widget.value;
    }
    super.initState();
  }

  setCodConShared(int codCon) async {
    widget.onChanged(codCon);
    print('entrou aqui');
    SharedPreferences.getInstance()
        .then((value) => value.setInt('codCon', codCon));
  }

  @override
  Widget build(BuildContext context) {
    final valueContentPadding = widget.contentPadding ? 10.0 : 0.0;
    return DropdownButtonFormField(
      items: widget.list
          .map((element) => DropdownMenuItem(
                value: element.codcon,
                child: Text("${element.apelido}"),
              ))
          .toList(),
      focusNode: widget.focusNode,
      onChanged: (value) => setCodConShared(value),
      value: oldValue,
      validator: (value) => value != null ? null : "Campo obrigatório",
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(valueContentPadding),
        labelText: widget.label,
        hintText: widget.hint,
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

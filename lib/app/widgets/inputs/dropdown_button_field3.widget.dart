import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropdownButtonField3Widget extends StatefulWidget {
  final List<dynamic> list;
  final String label;
  final String hint;
  final Function onChanged;
  final FocusNode focusNode;
  final bool contentPadding;
  final int value;
  const DropdownButtonField3Widget({Key key, this.list, this.label, @required this.hint, this.onChanged, this.focusNode, this.contentPadding = true, this.value})
      : assert(hint != null),
        super(key: key);

  @override
  _DropdownButtonField3WidgetState createState() => _DropdownButtonField3WidgetState();
}

class _DropdownButtonField3WidgetState extends State<DropdownButtonField3Widget> {
  int oldValue;

  @override
  void initState() {
    if (widget.value == null) {
      SharedPreferences.getInstance().then((storage) {
        var r = storage.getInt('codord');
        setState(() {
          if (r != null) {
            oldValue = r;
          } else {
            oldValue = widget.list[0].codord;
          }
        });
      });
    } else {
      oldValue = widget.value;
    }
    super.initState();
  }

  setCodConShared(int codord) async {
    widget.onChanged(codord);

    SharedPreferences.getInstance().then((value) => value.setInt('codord', codord));
  }

  @override
  Widget build(BuildContext context) {
    final valueContentPadding = widget.contentPadding ? 10.0 : 0.0;
    return DropdownButtonFormField(
      items: widget.list
          .map((element) => DropdownMenuItem(
                value: element.codord,
                child: Text("${element.apelido} - ${element.codimo}"),
              ))
          .toList(),
      focusNode: widget.focusNode,
      onChanged: (v) {
        widget.onChanged(v);
        setCodConShared(v);
      },
      value: oldValue,
      validator: (value) => value != null ? null : "Campo obrigatório",
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(valueContentPadding),
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

import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownButtonFieldWidget extends StatelessWidget {
  final List<CondominioEntity> list;
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
  Widget build(BuildContext context) {
    return Dismissible(key: key, child: ListTile());
  }
}

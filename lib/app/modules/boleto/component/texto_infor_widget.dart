import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextoInforWidget extends StatelessWidget {
  const TextoInforWidget({Key key, this.titulo, this.valor}) : super(key: key);
  final String titulo;
  final String valor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${titulo}: '),
        SizedBox(
          height: 30.h,
        ),
        Text(
          valor,
          style: TextStyle(
              color: AppColorScheme.primaryColor,
              fontSize: 32.sp,
              fontFamily: 'roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        )
      ],
    );
  }
}

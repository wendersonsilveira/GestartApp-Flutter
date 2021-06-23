import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressCustom extends StatelessWidget {
  final Color color;
  CircularProgressCustom({this.color: AppColorScheme.primaryColor});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 36.h,
        height: 36.h,
        child: CircularProgressIndicator(
          strokeWidth: 5.w,
          valueColor: new AlwaysStoppedAnimation<Color>(color),
        ));
  }
}

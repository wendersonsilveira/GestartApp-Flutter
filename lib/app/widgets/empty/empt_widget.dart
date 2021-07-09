import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key key, this.descricao}) : super(key: key);
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.subtitles_off,
            size: 70,
            color: AppColorScheme.primaryColor,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(descricao),
        ],
      ),
    );
  }
}

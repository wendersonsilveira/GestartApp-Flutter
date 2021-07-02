import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key key, this.nomTip, this.apelido}) : super(key: key);
  final String nomTip;
  final String apelido;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        nomTip,
        style: TextStyle(fontSize: 25.h, color: Colors.grey),
      ),
      Text(
        '- ${apelido}',
        style: TextStyle(fontSize: 23.h, color: Colors.grey),
      )
    ]);
  }
}

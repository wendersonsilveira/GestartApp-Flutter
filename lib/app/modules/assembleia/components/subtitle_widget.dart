import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({Key key, this.data, this.hora, this.local})
      : super(key: key);
  final DateTime data;
  final DateTime hora;
  final String local;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Data: ' +
            UIHelper.formatDate(data) +
            '-' +
            UIHelper.formatTime(hora)),
        Text('Local: $local'),
      ],
    );
  }
}
